function delayedCallback(message, delay) {
  setTimeout(() => {
    console.log(message);
  }, delay);
}

delayedCallback("This is delayed", 2000, );