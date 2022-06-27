const deleteTopic = () => {
  const csrfToken = document.querySelector("meta[name='csrf-token']").content;
  const delete_topic_btns = document.querySelectorAll(".delete_topic_btn");
  delete_topic_btns.forEach((delete_topic_btn) => {
    delete_topic_btn.addEventListener("click", function(){
      const topicId = this.getAttribute("data");
      deleteData(csrfToken, topicId);
    });
  });
};

const deleteData = (csrfToken, topicId) => {
  const deleteTopicElement = document.getElementById(`past_topic_${topicId}`);
  const formData = new FormData();
  formData.set("authenticity_token", `${csrfToken}`);
  const XHR = new XMLHttpRequest();
  XHR.open("DELETE", `/past_topics/${topicId}`, true);
  XHR.send(formData); // 削除リクエストの送信
  XHR.onload = () => {
    console.log(deleteTopicElement);
    deleteTopicElement.remove();
  };
};

window.addEventListener("load", deleteTopic);

export { deleteData };