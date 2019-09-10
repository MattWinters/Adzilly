document.addEventListener("turbolinks:load", function(){
  if(window.location.href.indexOf("/businesses/new") > -1){

    var addLocationButton = document.querySelector(".new-business__add-new-location");
    var locationFieldBlok = document.querySelector(".new-business__add-location");
    var locationFieldBlokcontainer = document.querySelector(".new-business__add-location-container");
    var counterId = 1;

    addLocationButton.onclick = addNewFieldBlock;

    function addNewFieldBlock() {
      var newLocationBlock = locationFieldBlok.cloneNode(true);
      var newLocationBlockLabel = newLocationBlock.querySelector(".new-business__label-image");
      var newLocationBlockInput = newLocationBlock.querySelector(".new-business__add-photo");
      var containerForImage = newLocationBlock.querySelector(".new-business__image-location-preview")
      var newIdForLabelInput = "add-new-photo" + counterId++;

      newLocationBlockLabel.setAttribute("for", newIdForLabelInput);
      newLocationBlockInput.setAttribute("id", newIdForLabelInput);
      containerForImage.setAttribute("src", "/assets/noimage.png");

      newLocationBlock.querySelectorAll(".new-business__reset-fields").forEach(
          function(resetFields) {
            resetFields.value = "";
          }
      );

      locationFieldBlokcontainer.appendChild(newLocationBlock);

    };

    locationFieldBlokcontainer.onclick = function(event) {
      var focusInput = event.target;
      var imageContainer = focusInput.parentNode.querySelector(".new-business__image-location-preview");

      if(focusInput.classList.contains('new-business__add-photo')) {

        focusInput.addEventListener("change",previewFile);

        function previewFile() {
          var preview = document.querySelector('img');
          var file    = focusInput.files[0];
          var reader  = new FileReader();

          reader.addEventListener("load", addSrcForImage, false);

          function addSrcForImage() {
            imageContainer.src = reader.result;
          };

          if (file) {
            reader.readAsDataURL(file);
          };
        };
      };

      var quantityLocations = locationFieldBlokcontainer.querySelectorAll(".new-business__add-location");

      if(focusInput.classList.contains('new-business__delete-location') && quantityLocations.length > 1){

          focusInput.parentNode.remove();

      };
    };
  };
});
