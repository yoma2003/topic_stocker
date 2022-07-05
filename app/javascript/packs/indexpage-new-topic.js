import { updateData } from "./update-data";
import { today } from "./today";

const newTopic = () => {
  const csrfToken = document.querySelector("meta[name='csrf-token']").content;
  const newTopicButtons = document.querySelectorAll(".index_new_topic_btn");
  newTopicButtons.forEach((newTopicButton) => {
    const characterId = newTopicButton.getAttribute("data-character_id");
    newTopicButton.addEventListener("click", function(){
      newData(csrfToken, characterId);
    });
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
    const pastTopic = document.getElementById(`past_topic_${characterId}`);
    pastTopic.querySelector(".topic_form").remove();
    // 既存のtopic_formを削除
    const newTopic = XHR.response.new_past_topic; // 新規フォームデータの取得
    console.log(newTopic);
    const html = `
      <form class="topic_form" data="${newTopic.id}" action="/past_topics/${newTopic.id}" accept-charset="UTF-8" method="post">
        <input type="hidden" name="_method" value="patch"><input type="hidden" name="authenticity_token" value="${csrfToken}">
        <input value="${characterId}" type="hidden" name="past_topic[character_id]" id="past_topic_character_id">
        <input class="created_date past_topic_input past_topic_create_date" value="${newTopic.created_date}" type="date" name="past_topic[created_date]" id="past_topic_created_date">
        <textarea class="topic_input past_topic_input past_topic_text" name="past_topic[past_topic]" id="new_past_topic_input_${newTopic.id}"></textarea>
      </form>            
    `; // newTopic.id同じモノを繰り返しすぎ・・・
    pastTopic.insertAdjacentHTML("afterbegin", html); // 新規フォームをHTMLに挿入
    updateNewTopic(newTopic.id); //処理を外に出したい・・・（async/awaitあたり？）
  };
};

const updateNewTopic = (newTopicId) => {
  const newPastTopicInput = document.getElementById(`new_past_topic_input_${newTopicId}`);
  newPastTopicInput.addEventListener("blur", function(e){
    updateData(newPastTopicInput, "past_topics");
  });
  newPastTopicInput.addEventListener("focus", function(){
    console.log("OK");
    window.addEventListener("beforeunload", function(e){ // 削除やnewの後に更新するとエラーが出やすい。恐らくnullになるから。
      updateData(newPastTopicInput, "past_topics");
    });
  });
};

window.addEventListener("load", newTopic);