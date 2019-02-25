/**
 * 返回顶部按钮
 * @author 徐虎
 * 
 */
var backButton=$('.back_to_top');
    function backToTop() {
        $('html,body').animate({
            scrollTop: 0
        }, 800);
    }
    backButton.on('click', backToTop);
 
    $(window).on('scroll', function () {/*���������Ĵ�ֱλ�ô�����������ܿ�����ҳ����ǲ��ֵĸ߶�ʱ���ص�������ť����ʾ */
        if ($(window).scrollTop() > $(window).height())
            backButton.fadeIn();
        else
            backButton.fadeOut();
    });
    $(window).trigger('scroll');