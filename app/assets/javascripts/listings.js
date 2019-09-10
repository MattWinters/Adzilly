document.addEventListener("turbolinks:load", function() {
  if(window.location.href.indexOf("/businesses") > -1) {
    document.addEventListener("listingsSlider", sliderOnload);

    sliderOnload();

    function sliderOnload() {
      var listingImagesContainer = document.querySelectorAll('.listings__locations-slider-container');

      listingImagesContainer.forEach(function(containerImage) {

        var sliderContainer = containerImage.querySelector('.listings__locations-slider');
        var slider = tns({
          "container": sliderContainer,
          "items": 1,
          "nav": false,
          "controls": false
        });

        var listingsButtonNext = containerImage.querySelector('.listings__slider-button-next');
        var listingsButtonprev = containerImage.querySelector('.listings__slider-button-prev');

        if(containerImage.length < 1) {
          listingsButtonNext.style.display = "none";
          listingsButtonprev.style.display = "none";
        }else{
          listingsButtonNext.onclick = function() { slider.goTo('next'); };
          listingsButtonprev.onclick = function() { slider.goTo('prev'); };
        }
      });
    };

    var listingsOpeneFilterBlock = document.querySelector('.listings__mobile-filter');
    var listingsFilter = document.querySelector('.listings__filter-form');
    var listingsOpeneFilterButton = document.querySelector('.listings__arrow-down-close');

    listingsOpeneFilterBlock.onclick = listingsOpenlter;

    function listingsOpenlter(){
      listingsFilter.classList.toggle('listings__open-filter');
      listingsOpeneFilterButton.classList.toggle('listings__close-filter');
    }
  };
});
