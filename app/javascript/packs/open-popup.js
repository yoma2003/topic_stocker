const openHelpView = () => {
  const openBtn = document.querySelector(".help_btn");
  const popup = document.querySelector(".help_view");

  console.log(openBtn);
  console.log(popup);
  openBtn.addEventListener("click", function(e) {
    popup.classList.add("visible");
  });
};

window.addEventListener("load", openHelpView);