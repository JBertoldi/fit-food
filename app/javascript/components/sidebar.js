function activateTab () {
  if ($('.tab')) {
    $(document).ready(function () {
      $('.tab').click(function (e) {
        e.preventDefault();
        $('.tab').removeClass('active');
        $(this).addClass('active');
      });
    });
  };
};

function toggleTab () {
  if ($('.sidebar')) {
    $('.sidebar a').click(function (e) {
      e.preventDefault();
      $('.profile-secondary').hide();
      const toShow = $(this).attr('href');
      $(toShow).show();
    });
  };
};

export { activateTab, toggleTab };