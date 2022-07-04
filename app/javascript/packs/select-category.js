const categorySelect = () => {
  const categorySelectBox = document.querySelector(".category_select_box");
  let isOpen = false;
  window.addEventListener("click", function(e) {
    if (isOpen == false && (e.target.closest('#category_open_btn'))) {
      categorySelectBox.classList.add("visible");
      isOpen = true;
    } else if (isOpen == true && (e.target.closest('.category_select_box') == null)) {
      reloadCheckedCategories();
      categorySelectBox.classList.remove("visible");
      isOpen = false;
    }
  });
};

const reloadCheckedCategories = () => {
  const categoryCheckboxes = document.getElementsByClassName("category_checkbox");
  const checkedCategories = {};
  for(i = 0; i < categoryCheckboxes.length; i++) {
    if (categoryCheckboxes[i].checked) {
      const checkedCategoryId = categoryCheckboxes[i].value;
      const checkedCategoryName = categoryCheckboxes[i].nextElementSibling.innerHTML;
      checkedCategories[checkedCategoryId] = checkedCategoryName;
    }
  }
  const affiliationCategory = document.querySelector(".affiliation_category");
  let html = "カテゴリ：";
  for(const [key, value] of Object.entries(checkedCategories)) {
    html += `<a href="/categories/${key}">${value}</a> `;
  }
  affiliationCategory.innerHTML = html;
};

window.addEventListener("load", categorySelect);