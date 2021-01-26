function displayNotice() {
  $('.notice')
    .css({ right: 0 })
    .animate({ right: '5vw' }, 900);
}

function hideNotice() {
  $('.notice')
  .fadeOut()
}

function notice() {
  displayNotice();
  setTimeout(hideNotice, 8000);
}

if($('.notice')) {
  console.log('notice');
  notice();
}

export { notice };
