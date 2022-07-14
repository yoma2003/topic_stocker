const selectCharacter = () => {
  let isSelect = false;
  window.addEventListener("click", function(e) {
    if (isSelect == true && e.target.closest('.character') == null) { // キャラクター以外をクリックしてselectが無い
      const selectedCharacter = document.querySelector(".select");
      closeCharacterBox(selectedCharacter);
      isSelect = false;
    }
  });

  const characters = document.querySelectorAll(".character");
  characters.forEach(function(character) {    
    character.addEventListener("click", function(e) {
      if (this.classList.contains("select") == true) { // selectされているキャラクター
        return;
      } else if (isSelect == true) { // selectされていないキャラクター
        const selectedCharacter = document.querySelector(".select");
        closeCharacterBox(selectedCharacter);
        openCharacterBox(this);
      } else { // selectがついていない
        openCharacterBox(this);
      }
      isSelect = true;
    });
  });
};

const closeCharacterBox = (character) => {
  character.classList.remove("select");
  character.querySelector(".past_topic_text").setAttribute("disabled", true);
  character.querySelector(".past_topic_create_date").setAttribute("disabled", true);
  character.querySelector(".index_new_topic_btn").setAttribute("disabled", true);
  character.querySelector(".index_delete_topic_btn").setAttribute("disabled", true);
  character.querySelector(".future_topic_input").setAttribute("disabled", true);
  character.querySelector(".index_new_topic_btn").classList.remove("visible");
  character.querySelector(".index_delete_topic_btn").classList.remove("visible");
}

const openCharacterBox = (character) => {
  character.classList.add("select");
  character.querySelector(".past_topic_text").removeAttribute("disabled");
  character.querySelector(".past_topic_create_date").removeAttribute("disabled");
  character.querySelector(".index_new_topic_btn").removeAttribute("disabled");
  character.querySelector(".index_delete_topic_btn").removeAttribute("disabled");
  character.querySelector(".future_topic_input").removeAttribute("disabled");
  character.querySelector(".index_new_topic_btn").classList.add("visible");
  character.querySelector(".index_delete_topic_btn").classList.add("visible");
}

window.addEventListener("load", selectCharacter);