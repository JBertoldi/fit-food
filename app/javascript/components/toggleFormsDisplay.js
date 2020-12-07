const toggleForms = () => {
  $('.toggle-instructions').click( function(e) {
    e.preventDefault();
    $('.form-container').toggle();
  });
}

export { toggleForms };