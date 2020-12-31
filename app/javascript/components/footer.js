function footerShow() {
  const footerInfo = $('footer .footer-info');

  $(window).scroll(function () {
    if ($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
      $(footerInfo).addClass('show');
    } else if ($(footerInfo).hasClass('show') && $(window).scrollTop() + $(window).height() > $(document).height() - 150) {
      $(footerInfo).removeClass('show');
    }
  });
}

export { footerShow };