document.addEventListener("turbolinks:load", function(){
  if(window.location.pathname == '/'){
    new Sliders({
      images: '.sliders img',
      btnPrev: '#home__button-slider-left',
      btnNext: '#home__button-slider-right'
    });

    var closeButtonModalWindow = document.querySelector(".home__overlay_modal .home__close_modal_window");
    var modalWindowBlock = document.querySelector(".home__overlay_modal");
    var watchIntroductionLink = document.querySelector(".home__link-watch-introduction");
    var videoIframe = document.querySelector(".home__introduction_video");

    watchIntroductionLink.onclick = openModalWindow;
    closeButtonModalWindow.onclick = closeModalWindow;
    modalWindowBlock.onclick = closeModalWindow;

    function openModalWindow(){
      modalWindowBlock.classList.add("active-modal");
      videoIframe.src = "https://www.youtube.com/embed/oGiN6xAzgGE";
    }

    function closeModalWindow(){
      modalWindowBlock.classList.remove("active-modal");
      videoIframe.src = "about:blank";
    }
  }
});
