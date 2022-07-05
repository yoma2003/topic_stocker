import { updateData } from "./update-data";

const updateTopic = () => {
  const pastTopicInputs = document.querySelectorAll(".past_topic_input");
  const futureTopicInputs = document.querySelectorAll(".future_topic_input"); //getElementByIdで取得したい
  pastTopicInputs.forEach(function(pastTopicInput){
    pastTopicInput.addEventListener("blur", function(e){
      updateData(pastTopicInput, "past_topics");
    });
    pastTopicInput.addEventListener("focus", function(){
      window.addEventListener("beforeunload", function(e){
        updateData(pastTopicInput, "past_topics");
      });
    });
  });
  futureTopicInputs.forEach(function(futureTopicInput){
    futureTopicInput.addEventListener("blur", function(e){
      updateData(futureTopicInput, "future_topics");
    });
    futureTopicInput.addEventListener("focus", function(){
      window.addEventListener("beforeunload", function(e){
        updateData(futureTopicInput, "future_topics");
      });
    });
  });
};

window.addEventListener("load", updateTopic);