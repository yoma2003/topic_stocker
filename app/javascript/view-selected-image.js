const viewSelectedImage = () => {
  const selectedCharacterImage = document.getElementById("selected_character_image");
  const selectImageBtn = document.getElementById('character_image');

  selectImageBtn.addEventListener('change', function (e) {
    console.log(e.target);
    let file = e.target.files[0];
    console.log(file);
    let blobUrl = window.URL.createObjectURL(file);
    selectedCharacterImage.src = blobUrl;
  });
};

window.addEventListener("load", viewSelectedImage);