import { updateData } from "./update-topic";

const newTopic = () => {
  const newTopicButton = document.getElementById("new_topic_btn");
  const characterId = newTopicButton.getAttribute("data-character_id");
  const csrfToken = document.querySelector("meta[name='csrf-token']").content;

  newTopicButton.addEventListener("click", function(){
    newData(csrfToken, characterId);
  });
};

const newData = (csrfToken, characterId) => {
  const formData = new FormData();
  formData.set("authenticity_token", `${csrfToken}`);
  formData.set("past_topic[created_date]", "2022-06-24");
  formData.set("past_topic[past_topic]","");
  formData.set("past_topic[character_id]",`${characterId}`);
  const XHR = new XMLHttpRequest();
  XHR.open("POST", "/past_topics", true);
  XHR.responseType = "json";
  XHR.send(formData); // 新規フォームデータの送信
  XHR.onload = () => {
    const newTopic = XHR.response.new_past_topic; // 新規フォームデータの取得
    const html = `
    <form class="topic_form" data="${newTopic.id}" action="/past_topics/${newTopic.id}" accept-charset="UTF-8" method="post">
      <input type="hidden" name="_method" value="patch">
      <input type="hidden" name="authenticity_token" value="${csrfToken}">
      <input value="${newTopic.created_date}" type="date" name="past_topic[created_date]" id="past_topic_created_date">              
      <textarea class="new_past_topic_input" name="past_topic[past_topic]" id="past_topic_past_topic"></textarea>
    </form>
    `;
  const pastTopics = document.getElementById("past_topics");
  pastTopics.insertAdjacentHTML("afterbegin", html); // 新規フォームをHTMLに挿入
  updateNewTopic(); //処理を外に出したい・・・（async/awaitあたり？）
  };
};

const updateNewTopic = () => {
  const newPastTopicInputs = document.querySelectorAll(".new_past_topic_input");

  newPastTopicInputs.forEach(function(newPastTopicInput){
    newPastTopicInput.addEventListener("blur", function(e){
      updateData(newPastTopicInput, "past_topics");
    });
    newPastTopicInput.addEventListener("focus", function(){
      console.log("OK");
      window.addEventListener("beforeunload", function(e){
        updateData(newPastTopicInput, "past_topics");
      });
    });
  });
};

window.addEventListener("load", newTopic);