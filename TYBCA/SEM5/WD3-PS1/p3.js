function greet(fName, callback) {
  console.log("Hi " + fName);
  callback();
}

function sayBye() {
  console.log("Goodbye!");
}

greet("First Name", sayBye);