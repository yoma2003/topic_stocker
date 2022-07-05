const deleteData = (csrfToken, topicId) => {
  const deleteTopicElement = document.getElementById(`past_topic_${topicId}`);
  const formData = new FormData();
  formData.set("authenticity_token", `${csrfToken}`);
  const XHR = new XMLHttpRequest();
  XHR.open("DELETE", `/past_topics/${topicId}`, true);
  XHR.send(formData); // 削除リクエストの送信
  XHR.onload = () => {
    deleteTopicElement.remove();
  };
};

export { deleteData };