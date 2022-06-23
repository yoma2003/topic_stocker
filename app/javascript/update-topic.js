const updateTopic = () => {
  const pastTopicInputs = document.querySelectorAll(".past_topic_input");
  const futureTopicInputs = document.querySelectorAll(".future_topic_input");
  pastTopicInputs.forEach(function(pastTopicInput){
    pastTopicInput.addEventListener("blur", function(e){
      updateData(pastTopicInput);
    });
    pastTopicInput.addEventListener("focus", function(){
      window.addEventListener("beforeunload", function(e){
        updateData(pastTopicInput);
      });
    });
  });
  futureTopicInputs.forEach(function(futureTopicInput){
    futureTopicInput.addEventListener("blur", function(e){
      updateData(futureTopicInput);
    });
    futureTopicInput.addEventListener("focus", function(){
      window.addEventListener("beforeunload", function(e){
        updateData(futureTopicInput);
      });
    });
  });
};

const updateData = (topicInput) => {
  const form = topicInput.parentElement;
  const form_id = form.getAttribute("data")
  const formData = new FormData(form);
  const XHR = new XMLHttpRequest();
  XHR.open("PUT", `/future_topics/${form_id}`, true);
  XHR.send(formData);
};

window.addEventListener("load", updateTopic);