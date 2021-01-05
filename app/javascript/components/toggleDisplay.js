function toggleEditRecipeName () {
  if ($('#recipe-name-edit-btn')) {
    $('#recipe-name-edit-btn').click(function(e) {
      e.preventDefault();
      $('#recipe-name').toggle();
      $('#recipe-name-edit').toggle();
    });
  }
}

function toggleForm () {
  if($('.form-toggle-btn')) {
    $('.form-toggle-btn').click(function(e) {
      e.preventDefault();
      $('.form-toggle').toggle();
    })
  };
}

export { toggleEditRecipeName, toggleForm };