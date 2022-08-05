const closeGuestUserError = () => {
  const xMark = document.querySelector(".guest_user_error_x-mark");
  const errorBox = document.querySelector(".guest_user_error");
  xMark.addEventListener("click", function(e) {
    errorBox.remove();
  });

};

window.addEventListener("load", closeGuestUserError);