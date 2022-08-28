const closeGuestUserError = () => {
  const xMark = document.querySelector(".guest_user_error_x-mark");
  const popup = document.querySelector(".guest_user_error");
  xMark.addEventListener("click", function(e) {
    popup.remove();
  });
};

window.addEventListener("load", closeGuestUserError);