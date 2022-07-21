const editSns = () => {
  const editSnsBox = document.querySelector(".edit_sns_box");
  const editSnsBtn = document.querySelector(".edit_sns_btn");
  let isOpen = false;
  window.addEventListener("click", function(e) {
    if (isOpen == false && (e.target.closest('.edit_sns_btn'))) {
      console.log("ここ");
      editSnsBox.classList.add("visible");
      editSnsBtn.classList.add("clicked");
      isOpen = true;
    } else if (isOpen == true && (e.target.closest('.edit_sns_box') == null)) {
      reloadSnsIds();
      editSnsBox.classList.remove("visible");
      editSnsBtn.classList.remove("clicked");
      isOpen = false;
    }
  });
};

const reloadSnsIds = () => {
  console.log(document.querySelector(".edit_character_twitter_id"));
  const twitterId = document.querySelector(".edit_character_twitter_id").value;
  const facebookId = document.querySelector(".edit_character_facebook_id").value;
  const instagramId = document.querySelector(".edit_character_instagram_id").value;
  const snsLinks = document.querySelector(".edited_character_sns_links");
  
  let twitterHtml
  let facebookHtml
  let instagramHtml

  if (twitterId != "") {
    twitterHtml = `<a href="https://twitter.com/${twitterId}" class="twitter_link twitter_active" target="_blank"><i class="fa-brands fa-twitter-square"></i></a>`;
  } else {
    twitterHtml = `<p class="twitter_link"><i class="fa-brands fa-twitter-square"></i></p>`;
  }
  if (facebookId != "") {
    facebookHtml = `<a href="https://www.facebook.com/${facebookId}" class="facebook_link facebook_active" target="_blank"><i class="fa-brands fa-facebook-square"></i></a>`;
  } else {
    facebookHtml = `<p class="facebook_link"><i class="fa-brands fa-facebook-square"></i></p>`;
  }
  if (instagramId != "") {
    instagramHtml = `<a href="https://www.instagram.com/${instagramId}" class="instagram_link instagram_active" target="_blank"><i class="fa-brands fa-instagram-square"></i></a>`;
  } else {
    instagramHtml = `<p class="instagram_link"><i class="fa-brands fa-instagram-square"></i></p>`;
  }

  snsLinks.innerHTML = `${twitterHtml}${facebookHtml}${instagramHtml}`;
};

window.addEventListener("load", editSns);