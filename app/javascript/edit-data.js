const editData = () => {
  const characters = document.querySelectorAll(".character")
  characters.forEach(function(character) {    
    character.addEventListener("click", function() {
      const pastTopicInput = this.querySelector(".past_topic_input");
      const futureTopicInput = this.querySelector(".future_topic_input");
      const editedCharacter = document.querySelector(".edit")
      if (this.classList.contains("edit") == true) {
        return;
      } else if (editedCharacter != null) {
        editedCharacter.classList.remove("edit");
        editedCharacter.querySelector(".past_topic_input").setAttribute("disabled", true);
        editedCharacter.querySelector(".future_topic_input").setAttribute("disabled", true);
        this.classList.add("edit");
        pastTopicInput.removeAttribute("disabled");
        futureTopicInput.removeAttribute("disabled");

      } else {
        this.classList.add("edit");
        pastTopicInput.removeAttribute("disabled");
        futureTopicInput.removeAttribute("disabled");
      }
    });
  });
};

window.addEventListener("load", editData);