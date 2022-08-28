const closeHelpView = () => {
  const xMark = document.querySelector(".help_view_x-mark");
  const popup = document.querySelector(".help_view");
  xMark.addEventListener("click", function(e) {
    popup.classList.remove("visible");
  });
};

window.addEventListener("load", closeHelpView);