import $ from 'jquery';

function navResponsive() {
  $(window).scroll(function () {
    if ($(document).scrollTop() > 50) {
      $('.nav').addClass('affix');
    } else {
      $('.nav').removeClass('affix');
    }
  });
}

function navMenu(params) {
  $('.navTrigger').click(function () {
    $(this).toggleClass('active');
    console.log('Clicked menu');
    $('#mainListDiv').toggleClass('show_list');
    $('#mainListDiv').fadeIn();
  });
}

export { navMenu, navResponsive };