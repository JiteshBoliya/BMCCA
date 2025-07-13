const EventEmitter = require('events');
const light = new EventEmitter();
const colors = ['🔴 Red', '🟡 Yellow', '🟢 Green'];
let index = 0;

light.on('change', () => {
  console.log(colors[index]);
  index = (index + 1) % colors.length;
});

setInterval(() => {
  light.emit('change');
}, 3000);