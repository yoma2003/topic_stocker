import { updateData } from "./update-data";

const updateTopic = () => {
  const pastTopicInputs = document.querySelectorAll(".past_topic_input");
  const futureTopicInputs = document.querySelectorAll(".future_topic_input"); //getElementByIdで取得したい
  pastTopicInputs.forEach(function(pastTopicInput){
    pastTopicInput.addEventListener("blur", function(e){
      updateData(pastTopicInput, "past_topics");
      updateTime();
    });
    pastTopicInput.addEventListener("focus", function(){
      window.addEventListener("beforeunload", function(e){
        updateData(pastTopicInput, "past_topics");
        updateTime();
      });
    });
  });
  futureTopicInputs.forEach(function(futureTopicInput){
    futureTopicInput.addEventListener("blur", function(e){
      updateData(futureTopicInput, "future_topics");
      updateTime();
    });
    futureTopicInput.addEventListener("focus", function(){
      window.addEventListener("beforeunload", function(e){
        updateData(futureTopicInput, "future_topics");
        updateTime();
      });
    });
  });
};

const updateTime = () => {
  const updateTime = document.getElementById("update_time");
  const todayData = new Date();
  const html = `${todayData.getFullYear()}/${todayData.getMonth() + 1}/${todayData.getDate()} ${twoDigitsNum(todayData.getHours())}:${twoDigitsNum(todayData.getMinutes())} Topic自動保存`;
  updateTime.innerHTML = html;
};

const twoDigitsNum = (num) => {
  return ( '00' + num ).slice( -2 );
}

window.addEventListener("load", updateTopic);