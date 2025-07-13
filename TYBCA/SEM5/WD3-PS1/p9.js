const EventEmitter = require('events');
const timer = new EventEmitter();
let seconds = 5;

timer.on('tick', (s) => console.log(`Tick: ${s}`));
timer.on('end', () => console.log('Countdown ended!'));

const interval = setInterval(() => {
  if (seconds > 0) {
    timer.emit('tick', seconds);
    seconds--;
  } else {
    clearInterval(interval);
    timer.emit('end');
  }
}, 1000);