// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require('@rails/ujs').start()
require('turbolinks').start()
require('@rails/activestorage').start()
require('channels')

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// External imports
import 'bootstrap';

// Internal imports
import { navMenu, navResponsive } from '../components/navbar';
import { footerShow } from '../components/footer';
import { activateTab, toggleTab } from '../components/sidebar';
import { toggleEditRecipeName, toggleEditAccount } from '../components/toggleDisplay';

document.addEventListener('turbolinks:load', () => {
  navMenu();
  navResponsive();
  footerShow();
  activateTab();
  toggleTab();
  toggleEditRecipeName();
  toggleEditAccount();
});