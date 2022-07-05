const updateData = (topicInput, controller) => {
  const form = topicInput.parentElement;
  const form_id = form.getAttribute("data");
  const formData = new FormData(form);
  const XHR = new XMLHttpRequest();
  XHR.open("PUT", `/${controller}/${form_id}`, true);
  XHR.send(formData);
};

export { updateData };