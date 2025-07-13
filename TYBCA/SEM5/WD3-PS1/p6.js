const EventEmitter = require('events');
const emitter = new EventEmitter();

emitter.on('greet', () => {
  console.log("Welcome!");
});

emitter.emit('greet');