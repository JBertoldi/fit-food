const toggleEditRecipeName = () => {
  if ($('#recipe-name-edit-btn')) {
    $('#recipe-name-edit-btn').click( function(e) {
      e.preventDefault();
      $('#recipe-name').toggle();
      $('#recipe-name-edit').toggle();
    });
  }
}

export { toggleEditRecipeName };