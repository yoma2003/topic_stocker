const openOperationBtn = () => {
  const userOperation = document.querySelector(".user_operation");
  let isOpen = false;
  window.addEventListener("click", function(e) {
    if (isOpen == false && (e.target.closest('.main_top_user_data'))) {
      userOperation.classList.add("user_operation_active");
      isOpen = true;
    } else if (isOpen == true && (e.target.closest('#user_operation') == null)) {
      userOperation.classList.remove("user_operation_active");
      isOpen = false;
    }
  });
}

window.addEventListener("load", openOperationBtn);