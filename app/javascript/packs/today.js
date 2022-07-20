const today = () => {
  const todayData = new Date();
  return `${todayData.getFullYear()}-${todayData.getMonth() + 1}-${todayData.getDate()}`;
};

export { today };