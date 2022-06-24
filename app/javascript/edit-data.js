const editData = () => {
  const characters = document.querySelectorAll(".character")
  characters.forEach(function(character) {    
    character.addEventListener("click", function() {
      const pastTopicInput = this.children[1].children[0].children[0].children[3];
      const futureTopicInput = this.children[1].children[1].children[0].children[3];

      const editedCharacter = document.querySelector(".edit")
      if (this.classList.contains("edit") == true) {
        return;
      } else if (editedCharacter != null) {
        editedCharacter.classList.remove("edit");
        editedCharacter.children[1].children[0].children[0].children[3].setAttribute("disabled", true);
        editedCharacter.children[1].children[1].children[0].children[3].setAttribute("disabled", true);
        console.log("OK")
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