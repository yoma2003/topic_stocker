const editData = () => {
  const characters = document.querySelectorAll(".character")
  characters.forEach(function(character) {
    

    character.addEventListener("click", function() {
      const editedCharacter = document.querySelector(".edit")
      if (this.classList.contains("edit") == true) {
        this.classList.remove("edit");
      } else if (editedCharacter != null) {
        editedCharacter.classList.remove("edit");
        this.classList.add("edit");
      } else {
        this.classList.add("edit");
      }
    });
  });
};

window.addEventListener("load", editData);