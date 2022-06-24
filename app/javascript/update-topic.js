const updateTopic = () => {
  const pastTopicInputs = document.querySelectorAll(".past_topic_input");
  const futureTopicInputs = document.querySelectorAll(".future_topic_input");
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

const updateData = (topicInput, controller) => {
  const form = topicInput.parentElement;
  const form_id = form.getAttribute("data")
  const formData = new FormData(form);
  const XHR = new XMLHttpRequest();
  XHR.open("PUT", `/${controller}/${form_id}`, true);
  XHR.send(formData);
};

window.addEventListener("load", updateTopic);