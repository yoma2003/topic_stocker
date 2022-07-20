const updateTime = () => {
  const updateTime = document.getElementById("update_time");
  const todayData = new Date();
  const html = `${todayData.getFullYear()}/${todayData.getMonth() + 1}/${todayData.getDate()} ${twoDigitsNum(todayData.getHours())}:${twoDigitsNum(todayData.getMinutes())} Topic自動保存`;
  updateTime.innerHTML = html;
};

const twoDigitsNum = (num) => {
  return ( '00' + num ).slice( -2 );
}

export { updateTime };