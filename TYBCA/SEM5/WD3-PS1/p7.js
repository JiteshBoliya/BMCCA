const EventEmitter = require('events');
const emitter = new EventEmitter();

emitter.on('hello', () => {
  console.log("Hello listener 1");
});
emitter.on('hello', () => {
  console.log("Hello listener 2");
});

emitter.emit('hello');