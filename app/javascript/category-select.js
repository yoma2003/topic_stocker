const categorySelect = () => {
  const categorySelectBox = document.querySelector(".category_select_box");
  let isOpen = false;
  window.addEventListener("click", function(e) {
    if (isOpen == false && (e.target.closest('#category_open_btn'))) {
      categorySelectBox.classList.add("visible");
      isOpen = true;
    } else if (isOpen == true && (e.target.closest('.category_select_box') == null)) {
      categorySelectBox.classList.remove("visible");
      isOpen = false;
    }
  });
};

window.addEventListener("load", categorySelect);