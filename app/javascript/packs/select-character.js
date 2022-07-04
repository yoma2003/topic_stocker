const selectCharacter = () => {
  let isSelect = false;
  window.addEventListener("click", function(e) {
    const selectedCharacter = document.querySelector(".select")

    if (isSelect == true && e.target.closest('.character') == null) { // キャラクター以外をクリックしてselectが無い
      selectedCharacter.classList.remove("select");
      selectedCharacter.querySelector(".past_topic_input").setAttribute("disabled", true);
      selectedCharacter.querySelector(".future_topic_input").setAttribute("disabled", true);
      isSelect = false;
    }
  });

  const characters = document.querySelectorAll(".character");
  characters.forEach(function(character) {    
    character.addEventListener("click", function(e) {
      const pastTopicInput = this.querySelector(".past_topic_input");
      const futureTopicInput = this.querySelector(".future_topic_input");
      const selectedCharacter = document.querySelector(".select")

      if (this.classList.contains("select") == true) { // selectされているキャラクター
        return;
      } else if (isSelect == true) { // selectされていないキャラクター
        selectedCharacter.classList.remove("select");
        selectedCharacter.querySelector(".past_topic_input").setAttribute("disabled", true);
        selectedCharacter.querySelector(".future_topic_input").setAttribute("disabled", true);
        this.classList.add("select");
        pastTopicInput.removeAttribute("disabled");
        futureTopicInput.removeAttribute("disabled");
      } else { // selectがついていない
        this.classList.add("select");
        pastTopicInput.removeAttribute("disabled");
        futureTopicInput.removeAttribute("disabled");
      }
      isSelect = true;
    });
  });
};

window.addEventListener("load", selectCharacter);