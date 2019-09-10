document.addEventListener("turbolinks:load", function(){
  if(window.location.href.indexOf("/businesses/") > -1  && detectDevice == 'desktop'){
    var slider = tns({
      "container": "#business__slider-images-container",
      "gutter": 10,
      "items": 3,
      "nav": false,
      "controls": false
    });

    var quantityImages = document.querySelectorAll('#business__slider-images-container .business__slider-image');
    var businessButtonNext = document.querySelector('.business__slider-button-next');
    var businessButtonprev = document.querySelector('.business__slider-button-prev');

    if(quantityImages.length < 4){
      businessButtonNext.style.display = "none";
      businessButtonprev.style.display = "none";
    }else{
      businessButtonNext.onclick = function () { slider.goTo('next'); };
      businessButtonprev.onclick = function () { slider.goTo('prev'); };
    }

    quantityImages.forEach(function(item){
      item.addEventListener("click", changeSrcImage);
    });

    function changeSrcImage(){
      var imageSrc = this.getAttribute("src");
      var generalPhotoBig = document.querySelector(".business__general-image");
      generalPhotoBig.src = imageSrc;
    };
  };
});
