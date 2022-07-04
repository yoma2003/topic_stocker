import { updateData } from "./update-topic";
import { deleteData } from "./delete-topic";
import { today } from "./today";

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
  formData.set("past_topic[created_date]", `${today()}`);
  formData.set("past_topic[past_topic]","");
  formData.set("past_topic[character_id]",`${characterId}`);
  const XHR = new XMLHttpRequest();
  XHR.open("POST", "/past_topics", true);
  XHR.responseType = "json";
  XHR.send(formData); // 新規フォームデータの送信
  XHR.onload = () => {
    const newTopic = XHR.response.new_past_topic; // 新規フォームデータの取得
    const html = `
    <div id="past_topic_${newTopic.id}">
      <form class="topic_form" data="${newTopic.id}" action="/past_topics/${newTopic.id}" accept-charset="UTF-8" method="post">
        <input type="hidden" name="_method" value="patch">
        <input type="hidden" name="authenticity_token" value="${csrfToken}">
        <input value="${newTopic.created_date}" type="date" name="past_topic[created_date]" id="past_topic_created_date">              
        <textarea name="past_topic[past_topic]" id="new_past_topic_input_${newTopic.id}"></textarea>
      </form>
      <button type="button" id="delete_new_topic_btn_${newTopic.id}" data="${newTopic.id}">削除</button>
    </div>
    `; // newTopic.id同じモノを繰り返しすぎ・・・
  const pastTopics = document.getElementById("past_topics");
  pastTopics.insertAdjacentHTML("afterbegin", html); // 新規フォームをHTMLに挿入
  updateNewTopic(newTopic.id); //処理を外に出したい・・・（async/awaitあたり？）
  deleteNewTopic(newTopic.id);
  };
};

const updateNewTopic = (newTopicId) => {
  const newPastTopicInput = document.getElementById(`new_past_topic_input_${newTopicId}`);
  newPastTopicInput.addEventListener("blur", function(e){
    updateData(newPastTopicInput, "past_topics");
  });
  newPastTopicInput.addEventListener("focus", function(){
    console.log("OK");
    window.addEventListener("beforeunload", function(e){
      updateData(newPastTopicInput, "past_topics");
    });
  });
};

const deleteNewTopic = (newTopicId) => {
  const csrfToken = document.querySelector("meta[name='csrf-token']").content;
  const delete_new_topic_btn = document.getElementById(`delete_new_topic_btn_${newTopicId}`);
  delete_new_topic_btn.addEventListener("click", function(){
    const topicId = this.getAttribute("data");
    if (window.confirm(`話した事データ${topicId}（1件）を削除しますか？`)) {
      deleteData(csrfToken, topicId);
    } else {
      return;
    }
  });
};

window.addEventListener("load", newTopic);