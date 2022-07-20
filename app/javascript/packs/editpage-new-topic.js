import { updateData } from "./update-data";
import { deleteData } from "./editpage-delete-data";
import { today } from "./today";
import { updateTime } from "./update-time";

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
    <div class="past_topic_box" id="past_topic_${newTopic.id}">
      <form class="edit_character_topic_past_topic" data="${newTopic.id}" action="/past_topics/${newTopic.id}" accept-charset="UTF-8" method="post">
        <input type="hidden" name="_method" value="patch">
        <input type="hidden" name="authenticity_token" value="${csrfToken}">
        <input value="${newTopic.created_date}" type="date" name="past_topic[created_date]" class="created_date past_topic_input_${newTopic.id} past_topic_create_date" id="past_topic_created_date">              
        <textarea name="past_topic[past_topic]" class="topic_input past_topic_input_${newTopic.id} past_topic_text"></textarea>
        <a class="delete_topic_btn_${newTopic.id} delete_topic_btn"><i class="fa-regular fa-trash-can"></i></a>
      </form>
    </div>
    `; // newTopic.id同じモノを繰り返しすぎ・・・
    const editCharacterPastTopic = document.getElementById("edit_character_past_topic");
    editCharacterPastTopic.insertAdjacentHTML("afterbegin", html); // 新規フォームをHTMLに挿入
    updateNewTopic(newTopic.id); //処理を外に出したい・・・（async/awaitあたり？）
    deleteNewTopic(newTopic.id);
  };
};

const updateNewTopic = (newTopicId) => {
  const newPastTopicInputs = document.querySelectorAll(`.past_topic_input_${newTopicId}`);
  newPastTopicInputs.forEach(function(newPastTopicInput){
    newPastTopicInput.addEventListener("blur", function(e){
      updateData(newPastTopicInput, "past_topics");
      updateTime();
    });
    newPastTopicInput.addEventListener("focus", function(){
      window.addEventListener("beforeunload", function(e){
        if (document.activeElement == newPastTopicInput) {
          updateData(newPastTopicInput, "past_topics");
          updateTime();
        }
      });
    });
  });
};

const deleteNewTopic = (newTopicId) => {
  const csrfToken = document.querySelector("meta[name='csrf-token']").content;
  const delete_new_topic_btn = document.querySelector(`.delete_topic_btn_${newTopicId}`);
  delete_new_topic_btn.addEventListener("click", function(){
    if (window.confirm(`話した事データ${newTopicId}（1件）を削除しますか？`)) {
      deleteData(csrfToken, newTopicId);
    }
  });
};

window.addEventListener("load", newTopic);