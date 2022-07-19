const characterViewSelectedImage = () => {
  const selectedCharacterImage = document.querySelector(".selected_character_image");
  const selectImageBtn = document.getElementById('edit_character_image');

  selectImageBtn.addEventListener('change', function (e) {
    let file = e.target.files[0];
    let blobUrl = window.URL.createObjectURL(file);
    selectedCharacterImage.src = blobUrl;
  });
};

window.addEventListener("load", characterViewSelectedImage);