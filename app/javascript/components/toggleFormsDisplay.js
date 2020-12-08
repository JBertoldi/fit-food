const toggleForms = () => {
  if ($('.toggle-instructions')) {
    $('.toggle-instructions').click( function(e) {
      e.preventDefault();
      $('.form-container').toggle();
      $('.toggle-instructions').toggle();
    });
  }
}

export { toggleForms };