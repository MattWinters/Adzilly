document.addEventListener("turbolinks:load", function() {
  let toggle = document.getElementById("mobile_menu");
  let burgerMenu = document.getElementById("header-navigations");

  toggle.addEventListener('click', function open() {
    if (toggle.classList.contains('header_mb__menu')) {
      burgerMenu.style.display = 'inline-block';
      toggle.classList.add('header_mb__cross');
      toggle.classList.remove('header_mb__menu');
    } else {
      burgerMenu.style.display = 'none';
      toggle.classList.add('header_mb__menu');
      toggle.classList.remove('header_mb__cross');
    }
  });
});
