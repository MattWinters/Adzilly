function Sliders(obj) {
  this.images = document.querySelectorAll(obj.images);
  this.auto = obj.auto || false;
  this.btnPrev = obj.btnPrev;
  this.btnNext = obj.btnNext;
  this.rate = obj.rate || 2000;

  let i = 0;
  let slider = this;

  this.prev = function () {
    slider.images[i].classList.remove('slider-active');
    i--;
    if (i < 0) i = slider.images.length - 1;
    slider.images[i].classList.add('slider-active');
  };

  this.next = function () {
    slider.images[i].classList.remove('slider-active');
    i++;
    if (i >= slider.images.length) i = 0;
    slider.images[i].classList.add('slider-active');
  };

  document.querySelector(slider.btnPrev).onclick = slider.prev;
  document.querySelector(slider.btnNext).onclick = slider.next;

  if (slider.auto) setInterval(slider.next, slider.rate);

}
