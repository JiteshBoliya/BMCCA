let count = 0;
const dateTime = new Date();
const interval = setInterval(() => {
  console.log("Time:", dateTime.toLocaleTimeString());
  count++;
  if (count === 5) clearInterval(interval);
}, 1000);