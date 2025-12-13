void main() {
  // Variable declaration and initialization
  var a = 10; 
  print("Integer: $a");

// Data Types in Dart:
// 1. int: Represents integer values.
// 2. double: Represents floating-point values.
// 3. String: Represents a sequence of characters.
// 4. bool: Represents boolean values (true or false). 
// 5. List: Represents an ordered collection of items.
// 6. Map: Represents a collection of key-value pairs.
// 7. Set: Represents an unordered collection of unique items.
// 8. dynamic: Represents a variable that can hold any type of value.
// 9. var: Used for type inference, where the type is determined at runtime.
// 10. Object: The base class for all Dart classes.
// 11. num: A superclass for both int and double types.
// 12. Null: Represents the absence of a value.
// 13. Runes: Represents Unicode code points in a string.
// 14. Symbol: Represents an operator or identifier in Dart code.
// 15. Function: Represents a function or method in Dart.
// 16. Future: Represents a value that will be available at some point in the future (asynchronous programming).

  int b = 20;
  double c = 15.5;
  String d = "Hello, Dart!";
  bool e = true;
  List f = [1, 2, 3, 4, 5];
  Map g = {'name': 'Alice', 'age': 25};
  Set h = {1, 2, 3, 4, 5};
  dynamic i = "I can be anything";
  Object j = 42;
  num k = 3.14;
  Null l = null;
  Function add = (int x, int y) {
    return x + y;
  };
  Runes runes = Runes('\u{1F600}'); // Unicode for 😀
  Symbol sym = #mySymbol;
  Future m = Future.value("Future Value");

  print("Integer: $b");
  print("Double: $c");
  print("String: $d");
  print("Boolean: $e");
  print("List: $f");
  print("Map: $g");
  print("Set: $h");
  print("Dynamic: $i");
  print("Object: $j");
  print("Num: $k");
  print("Null: $l");
  print("Function result: ${add(5, 10)}");
  print("Runes: ${String.fromCharCodes(runes)}"); // Output: 😀
  print("Symbol: $sym");  // Output: Symbol("mySymbol")
  print("Future: ${m.then((value) => print(value))}"); // Output: Future Value

  // -------------------------------------------------------------------
  // Type of Functions
  // -------------------------------------------------------------------
  // Simple Function
  void greet(String name) {
    print("Hello, $name!");
  }
  greet("World");

  // Named Function
  int multiply(int x, int y) {
    return x * y;
  }
  print("Multiplication: ${multiply(4, 5)}");

  // Anonymous Function
  var numbers = [1, 2, 3, 4, 5];
  var squares = numbers.map((n) => n * n);
  print("Squares: $squares");

  // Arrow Function
  var addArrow = (int x, int y) => x + y;
  print("Arrow Function Addition: ${addArrow(7, 8)}");

  // Optional Parameters
  String buildGreeting(String name, [String? title]) {
    if (title != null) {
      return "Hello, $title $name!";
    } else {
      return "Hello, $name!";
    }
  }
  print(buildGreeting("Alice"));
  print(buildGreeting("Bob", "Dr."));

  // -------------------------------------------------------------------
  // String Manipulation
  // -------------------------------------------------------------------
  String sample = "Dart Programming Language";
  print("Original String: $sample");

  // Length of the string
  print("Length: ${sample.length}");
  
  // Convert to uppercase
  print("Uppercase: ${sample.toUpperCase()}");

  // Convert to lowercase
  print("Lowercase: ${sample.toLowerCase()}");

  // Substring
  print("Substring (5, 16): ${sample.substring(5, 16)}");

  // Replace
  print("Replace 'Dart' with 'Flutter': ${sample.replaceAll('Dart', 'Flutter')}");

  // Split
  print("Split by space: ${sample.split(' ')}");

  // Trim
  String padded = "   Hello Dart!   ";
  print("Trimmed: '${padded.trim()}'");

  // Comments in Dart
  
  // This is a single-line comment
  
  /*
    This is a 
    multi-line comment
  */

  /// This is a documentation comment


  // String Interpolation
  String name = "Dart";
  int version = 2;
  print("Welcome to $name version $version!");

  // Use of '', "", and """ """
  String singleQuote = 'This is a string with single quotes.';
  String doubleQuote = "This is a string with double quotes.";
  String multiLine = """This is a 
  multi-line string using triple double quotes.""";
  print(singleQuote);
  print(doubleQuote);
  print(multiLine);

  // -------------------------------------------------------------------
  // List Operations
  // -------------------------------------------------------------------
  List<int> numList = [10, 20, 30, 40, 50];
  print("Original List: $numList");
  
  // Add an element
  numList.add(60);
  print("After Adding 60: $numList");

  // Remove an element
  numList.remove(20);
  print("After Removing 20: $numList");

  // Access an element
  print("Element at index 2: ${numList[2]}");

  // Iterate through the list
  print("Iterating through the list:");










  // -------------------------------------------------------------------
  // OOPS Concepts
  // -------------------------------------------------------------------
  // Class and Object
  var person1 = Person("John", 30);
  person1.introduce();

  // Inheritance
  var student1 = Student("Jane", 20, "Computer Science");
  student1.introduce();

  // Polymorphism
  List<Animal> animals = [Dog(), Cat()];
  for (var animal in animals) {
    animal.sound();
  }

  // Encapsulation
  var account = BankAccount("123456789", 1000.0);
  account.deposit(500.0);
  account.withdraw(200.0);
  print("Account Balance: \$${account.balance}");
}

// OOPS Concepts

// Class and Object
class Person {
  String name;
  int age;
  Person(this.name, this.age); // Constructor
  void introduce() {
    print("Hi, I'm $name and I'm $age years old.");
  }
}

// Inheritance
class Student extends Person {  
  String major;
  Student(String name, int age, this.major) : super(name, age);
  @override // Method overriding
  void introduce() {
    super.introduce(); // super keyword to call parent method
    print("I'm studying $major.");
  }
}

// Polymorphism
class Animal {
  void sound() {
    print("Animal makes a sound");
  }
}
class Dog extends Animal {
  @override
  void sound() {
    print("Dog barks");
  }
}
class Cat extends Animal {
  @override
  void sound() {
    print("Cat meows");
  }
}

// Encapsulation
class BankAccount {
  String _accountNumber; // Private variable
  double _balance; // Private variable

  BankAccount(this._accountNumber, this._balance);

  // Getter for balance
  double get balance => _balance;

  // Method to deposit money
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited: \$${amount}. New balance: \$${_balance}");
    } else {
      print("Deposit amount must be positive.");
    }
  }

  // Method to withdraw money
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("Withdrew: \$${amount}. New balance: \$${_balance}");
    } else {
      print("Insufficient balance or invalid amount.");
    }
  }
}
