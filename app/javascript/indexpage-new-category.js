const newCategory = () => {
  const newCategoryBtn = document.getElementById("new_category_btn");
  const newCategoryForm = document.getElementById("new_category_form");
  const categories = document.getElementById("categories");
  const csrfToken = document.querySelector("meta[name='csrf-token']").content;
  

  newCategoryBtn.addEventListener("click", function() {
    const html = `
      <form action="/categories" accept-charset="UTF-8" method="post" id="new_category_form">
        <input type="hidden" name="authenticity_token" value="${csrfToken}">
        <input type="text" name="category[name]" id="category_name">
        <input type="hidden" name="category[describe]" id="category_describe">
        <input type="submit" name="commit" value="追加" id="new_category_form_btn">
      </form>
    `;
    newCategoryForm.insertAdjacentHTML("afterbegin", html); // 新規フォームをHTMLに挿入
    this.remove();
  });
};

window.addEventListener("load", newCategory);