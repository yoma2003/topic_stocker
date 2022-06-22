const editData = () => {
  const characters = document.querySelectorAll(".character")
  characters.forEach(function(character) {    
    character.addEventListener("click", function(e) {
      const pastTopicInput = this.children[1].children[0].children[0].children[3];
      const futureTopicInput = this.children[1].children[1].children[0].children[3];

      const editedCharacter = document.querySelector(".edit")

      if (this.classList.contains("edit") == true) {
        e.preventDefault();
      } else if (editedCharacter != null) {
        editedCharacter.classList.remove("edit");
        editedCharacter.children[1].children[0].children[0].children[3].setAttribute("disabled", true);
        editedCharacter.children[1].children[1].children[0].children[3].setAttribute("disabled", true);

        this.classList.add("edit");
        pastTopicInput.removeAttribute("disabled");
        futureTopicInput.removeAttribute("disabled");

      } else {
        this.classList.add("edit");
        pastTopicInput.removeAttribute("disabled");
        futureTopicInput.removeAttribute("disabled");
      }
    });

    // character.addEventListener("blur", function() {
    //   const pastTopicInput = this.children[1].children[0].children[0].children[3];
    //   const futureTopicInput = this.children[1].children[1].children[0].children[3];

    //   this.classList.remove("edit");
    //   pastTopicInput.setAttribute("disabled", true);
    //   futureTopicInput.setAttribute("disabled", true);
    // });
  });
};

window.addEventListener("load", editData);