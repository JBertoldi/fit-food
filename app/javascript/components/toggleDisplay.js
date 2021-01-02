function toggleEditRecipeName () {
  if ($('#recipe-name-edit-btn')) {
    $('#recipe-name-edit-btn').click(function(e) {
      e.preventDefault();
      $('#recipe-name').toggle();
      $('#recipe-name-edit').toggle();
    });
  }
}

function toggleEditAccount () {
  if($('.edit-account-btn')) {
    $('.edit-account-btn').click(function(e) {
      e.preventDefault();
      $('.account-edit').toggle();
    })
  };
}

export { toggleEditRecipeName, toggleEditAccount };