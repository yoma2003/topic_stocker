const userViewSelectedImage = () => {
  const selectedUserImage = document.querySelector(".selected_user_image");
  const selectImageBtn = document.getElementById('edit_user_image');

  selectImageBtn.addEventListener('change', function (e) {
    let file = e.target.files[0];
    let blobUrl = window.URL.createObjectURL(file);
    selectedUserImage.src = blobUrl;
  });
};

window.addEventListener("load", userViewSelectedImage);