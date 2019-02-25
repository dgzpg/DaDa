package cn.rt.util;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.commons.beanutils.BeanUtils;

/**
 * jdbc宸ュ叿绫�
 * 
 *
 */
public final class jdbc {
	private static String driver;
	private static String url;
	private static String user;
	private static String password;

	static {
		try {
			Properties ps = new Properties();
			InputStream instream = jdbc.class.getResourceAsStream("/jdbc.properties");
			ps.load(instream); // 鍔犺浇灞炴�ф枃浠�
			driver = ps.getProperty("driver");
			url = ps.getProperty("url");
			user = ps.getProperty("user");
			password = ps.getProperty("password");
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	
	public static Connection getConn() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			System.out.println("连接数据库失败！");
			//e.printStackTrace();
		}
		return conn;
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static List getList(Class clazz, String sql) {
		List list = new ArrayList();
		Connection conn = getConn();
		PreparedStatement st = null;
		ResultSet rs = null;

		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();
			while (rs.next()) { 
				Object obj = clazz.newInstance();
				for (int i = 1; i <= metaData.getColumnCount(); i++) {
					BeanUtils.copyProperty(obj, metaData.getColumnName(i), rs.getObject(i));
				}
				list.add(obj); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} finally {// 鍏抽棴
			close(rs, st, conn);
		}
		return list;
	}

	
	public static Object getObjectById(Class clazz, String sql,Object id) {
		Connection conn = getConn();
		PreparedStatement st = null;
		ResultSet rs = null;
		Object obj = null;
		try {
			st = conn.prepareStatement(sql);
			st.setObject(1,id);
			rs = st.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();
			if (rs.next()) { // 濡傛灉鍙互鏌ヨ鍑烘暟鎹�
				obj = clazz.newInstance(); // 瀹炰緥鍖栧璞�
				for (int i = 1; i <= metaData.getColumnCount(); i++) { // 璁剧疆鍚勪釜鍒楃殑鍊煎埌瀵硅薄  娉ㄦ剰锛氬垪鍚嶅拰灞炴�у悕瑕佷竴鑷�
					BeanUtils.copyProperty(obj, metaData.getColumnName(i), rs.getObject(i));
				}
			}
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} finally {
			close(rs, st, conn);
		}
		return obj;
	}

	
	public static int getListCount(String sql) {
		int result = 0;
		Connection conn = getConn();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();// 鎵ц鏌ヨ
			ResultSetMetaData metaData = rs.getMetaData();
			if (rs.next()) {
				result = rs.getInt(1);// 璁板綍鏌ヨ鍑虹殑缁撴灉
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, st, conn);
		}
		return result;
	}
	
	public static int getListcount(String sql) {
		int result = 0;
		Connection conn = getConn();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();// 鎵ц鏌ヨ
			ResultSetMetaData metaData = rs.getMetaData();
			while(rs.next()) {
				result++;// 璁板綍鏌ヨ鍑虹殑缁撴灉
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, st, conn);
		}
		return result;
	}
	/**添加操作
	 * @return */
	public static int executeSQL(String sql, Object... ps) {
		Connection conn = getConn();
		int executeUpdate = 0;
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = conn.prepareStatement(sql);
			for (int i = 1; i <= ps.length; i++) {// 设置参数
				prepareStatement.setObject(i, ps[i - 1]);
			}
			executeUpdate = prepareStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, prepareStatement, conn);
		}
		return executeUpdate;
	}

	
	/**
	 * 浜嬪姟绠＄悊
	 * 
	 * @param sqlArray
	 *            闇�瑕佸湪鍚屼竴涓簨鍔′腑澶勭悊鐨凷ql璇彞
	 */
	public static void executeTran(String... sqlArray) {
		Connection conn = getConn();
		PreparedStatement prepareStatement = null;
		try {
			conn.setAutoCommit(false);// 鍏抽棴鑷姩鎻愪氦
			if (sqlArray.length > 0) {
				for (String sql : sqlArray) {
					prepareStatement = conn.prepareStatement(sql);
					prepareStatement.execute();
				}
			}
			conn.commit();// 鎵�鏈夋搷浣滄墽琛岀粨鏉� 鎻愪氦浜嬪姟
			conn.setAutoCommit(true);// 鎵撳紑鑷姩浜嬪姟鎻愪氦
		} catch (SQLException e) {// 濡傛灉鍑虹幇寮傚父
			try {
				conn.rollback();// 鍥炴粴
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			close(null, prepareStatement, conn);
		}
	}

	/**
	 *鍏抽棴璧勬簮
	 * @param rs 缁撴灉闆�
	 * @param st 鍛戒护琛屽璞�
	 * @param conn 鏁版嵁搴撹繛鎺�
	 */
	private static void close(ResultSet rs, Statement st, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}		
			if (st != null) {

				st.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}

