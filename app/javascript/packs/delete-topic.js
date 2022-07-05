import { deleteData } from "./delete-data";

const deleteTopic = () => {
  const csrfToken = document.querySelector("meta[name='csrf-token']").content;
  const delete_topic_btns = document.querySelectorAll(".delete_topic_btn");
  delete_topic_btns.forEach((delete_topic_btn) => {
    delete_topic_btn.addEventListener("click", function(){
      const topicId = this.getAttribute("data");
      if (window.confirm(`話した事データ${topicId}（1件）を削除しますか？`)) {
        deleteData(csrfToken, topicId);
      } else {
        return;
      }
    });
  });
};

window.addEventListener("load", deleteTopic);