import { updateData } from "./update-data";
import { updateTime } from "./update-time";

const deleteTopic = () => {
  const csrfToken = document.querySelector("meta[name='csrf-token']").content;
  const delete_topic_btns = document.querySelectorAll(".index_delete_topic_btn");
  delete_topic_btns.forEach((delete_topic_btn) => {
    delete_topic_btn.addEventListener("click", function(){
      const latestPastTopicId = this.parentElement.querySelector(".topic_form").getAttribute("data");
      const characterId = this.getAttribute("data-character_id");
      console.log("OK");
      if (window.confirm(`編集中の話した事データ（1件）を削除しますか？`)) {
        deleteData(csrfToken, characterId, latestPastTopicId);
      } else {
        return;
      }
    });
  });
};

const deleteData = (csrfToken, characterId, topicId) => {
  const formData = new FormData();
  formData.set("authenticity_token", `${csrfToken}`);
  formData.set("character_id", `${characterId}`);
  const XHR = new XMLHttpRequest();
  XHR.open("DELETE", `/past_topics/${topicId}`, true);
  XHR.responseType = "json";
  XHR.send(formData); // 削除リクエストの送信
  XHR.onload = () => {
    const pastTopic = document.getElementById(`past_topic_character_${characterId}`);
    pastTopic.querySelector(".topic_form").remove();
    console.log("OK");
    // 既存のtopic_formを削除
    const latestTopic = XHR.response.latest_past_topic; // 新規フォームデータの取得
    console.log(latestTopic);
    const html = `
      <form class="topic_form" data="${latestTopic.id}" action="/past_topics/${latestTopic.id}" accept-charset="UTF-8" method="post">
        <input type="hidden" name="_method" value="patch"><input type="hidden" name="authenticity_token" value="${csrfToken}">
        <input value="${characterId}" type="hidden" name="past_topic[character_id]" id="past_topic_character_id">
        <input class="created_date past_topic_input past_topic_create_date" value="${latestTopic.created_date}" type="date" name="past_topic[created_date]" id="past_topic_created_date">
        <textarea class="topic_input past_topic_input past_topic_text" name="past_topic[past_topic]" id="latest_past_topic_input_${latestTopic.id}">${latestTopic.past_topic}</textarea>
      </form>            
    `; // newTopic.id同じモノを繰り返しすぎ・・・
    pastTopic.insertAdjacentHTML("afterbegin", html); // 新規フォームをHTMLに挿入
    updateLatestTopic(latestTopic.id); //処理を外に出したい・・・（async/awaitあたり？）
  };
};

const updateLatestTopic = (latestTopicId) => {
  const latestPastTopicInput = document.getElementById(`latest_past_topic_input_${latestTopicId}`);
  latestPastTopicInput.addEventListener("blur", function(e){
    updateData(latestPastTopicInput, "past_topics");
    updateTime();
  });
  latestPastTopicInput.addEventListener("focus", function(){
    window.addEventListener("beforeunload", function(e){ // 削除やnewの後に更新するとエラーが出やすい。恐らくnullになるから。
      if (document.activeElement == latestPastTopicInput) {
        updateData(latestPastTopicInput, "past_topics");
        updateTime();
      }
    });
  });
};

window.addEventListener("load", deleteTopic);