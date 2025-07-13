const EventEmitter = require('events');
const emitter = new EventEmitter();

function scheduleTask(priority, task) {
  if (priority === 'high') {
    process.nextTick(() => emitter.emit('task', task));
  } else if (priority === 'medium') {
    setImmediate(() => emitter.emit('task', task));
  } else {
    setTimeout(() => emitter.emit('task', task), 10);
  }
}

emitter.on('task', (task) => console.log("Executing:", task));

scheduleTask('high', 'High priority task');
scheduleTask('medium', 'Medium priority task');
scheduleTask('low', 'Low priority task');
