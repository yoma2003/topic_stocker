const categorySelect = () => {
  const categoryOpenBtn = document.getElementById("category_open_btn");
  const categorySelectBox = document.querySelector(".category_select_box");
  categoryOpenBtn.addEventListener("click", () => {
    categorySelectBox.classList.toggle("visible");
  });

  // const categoryCloseBtn = document.getElementById("category_close_btn");
  // categoryCloseBtn.addEventListener("click", () => {
  //   categorySelectBox.classList.remove("visible");
  // });
};

window.addEventListener("load", categorySelect);