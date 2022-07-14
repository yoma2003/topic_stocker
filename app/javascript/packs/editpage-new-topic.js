import { updateData } from "./update-data";
import { deleteData } from "./delete-data";
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
      <form class="edit_character_topic_past_topic" data="${newTopic.id}" action="/past_topics/${newTopic.id}" accept-charset="UTF-8" method="post">
        <input type="hidden" name="_method" value="patch">
        <input type="hidden" name="authenticity_token" value="${csrfToken}">
        <input value="${newTopic.created_date}" type="date" name="past_topic[created_date]" class="created_date new_past_topic_input past_topic_create_date" id="past_topic_created_date">              
        <textarea name="past_topic[past_topic]" class="topic_input new_past_topic_input past_topic_text"></textarea>
        <button type="button" class="delete_new_topic_btn" data="${newTopic.id}">削除</button>
      </form>
    </div>
    `; // newTopic.id同じモノを繰り返しすぎ・・・
  const pastTopics = document.getElementById("past_topics");
  pastTopics.insertAdjacentHTML("afterbegin", html); // 新規フォームをHTMLに挿入
  updateNewTopic(); //処理を外に出したい・・・（async/awaitあたり？）
  deleteNewTopic();
  };
};

const updateNewTopic = () => {
  const newPastTopicInputs = document.querySelectorAll(".new_past_topic_input");
  console.log(newPastTopicInputs)
  newPastTopicInputs.forEach(function(newPastTopicInput){
    newPastTopicInput.addEventListener("blur", function(e){
      updateData(newPastTopicInput, "past_topics");
    });
    newPastTopicInput.addEventListener("focus", function(){
      window.addEventListener("beforeunload", function(e){
        updateData(newPastTopicInput, "past_topics");
      });
    });
  });
};

const deleteNewTopic = () => {
  const csrfToken = document.querySelector("meta[name='csrf-token']").content;
  const delete_new_topic_btns = document.querySelectorAll(".delete_new_topic_btn");
  delete_new_topic_btns.forEach(function(delete_new_topic_btn){
    delete_new_topic_btn.addEventListener("click", function(){
      const topicId = this.getAttribute("data");
      if (window.confirm(`話した事データ${topicId}（1件）を削除しますか？`)) {
        deleteData(csrfToken, topicId);
      } else {
        return;
      }
    });
  });
};

window.addEventListener("load", newTopic);