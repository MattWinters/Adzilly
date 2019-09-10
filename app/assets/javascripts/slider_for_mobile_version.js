document.addEventListener("turbolinks:load", function() {
  if (window.location.href.indexOf("/businesses/") > -1 && detectDevice == 'mobile') {
    var slider = tns({
      container: document.querySelector(".business_mb__slider-other-photo"),
      mouseDrag: true,
      swipeAngle: false,
      items: 3,
      controls: false,
      axis: "vertical",
      nav: false,
      gutter: 9
    });

    let quantityImages = document.querySelectorAll('.business_mb__slider-other-photo .business_mb__place');
    quantityImages.forEach(function(item) {
      item.addEventListener("click", changeSrcImage);
    });

    function changeSrcImage() {
      let imageSrc = this.getAttribute("src");
      let generalPhotoBig = document.querySelector(".business_mb__main-photo-place");
      generalPhotoBig.src = imageSrc;
    };

    let sliderButtonNext = document.querySelector('.business_mb__slider-up');
    let sliderButtonPrev = document.querySelector('.business_mb__slider-down');

    sliderButtonNext.onclick = function() {
      slider.goTo('next');
    };

    sliderButtonPrev.onclick = function() {
      slider.goTo('prev');
    };
  }
});
