import { updateData } from "./update-data";
import { updateTime } from "./update-time";

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
        if (document.activeElement == pastTopicInput) {
          updateData(pastTopicInput, "past_topics");
          updateTime();
        }
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
        if (document.activeElement == futureTopicInput) {
          updateData(futureTopicInput, "future_topics");
          updateTime();
        }
      });
    });
  });
};

window.addEventListener("load", updateTopic);