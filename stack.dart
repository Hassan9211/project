// void main(List<String> args) {
//   Stack stack = Stack();
//   stack.push(1);
//   stack.push(2);
//   stack.push(3);
//   stack.push(4);
//   stack.push(5);
//   stack.display();
//   print(stack.pop());
//   // print(stack.peek());
//   // print(stack.isEmpty());
//   // print(stack.size());
//   stack.display();

// }

// class Stack {
//   List<int> stack = [];

//   void push(int value) {
//     stack.add(value);
//   }

//   int pop() {
//     if (stack.isEmpty){
//       throw Exception("Stack is empty");
//     }
//     return stack.removeLast();
//   }

//   int peek() {
//     if (stack.isEmpty){
//       throw Exception("Stack is empty");
//     }
//     return stack.last;
//   }

//   bool isEmpty() {
//     return stack.isEmpty;
//   }

//   int size() {
//     return stack.length;
//   }

//   void display() {
//     if (stack.isEmpty){
//       print("Stack is empty");
//     }
//     else{
//       for (int i = 0; i < stack.length; i++) {
//       print(stack[i]);
//     }
//     }
//   }
// }

class Stack {
  List<int> stack = [];

  void push(int value) {
    stack.add(value);
  }

  int pop() {
    if (stack.isEmpty) {
      throw Exception('stack is empty');
    }
    return stack.removeLast();
  }

  int peek() {
    if (stack.isEmpty) {
      throw Exception('stack is empity');
    }
    return stack.last;
  }

  bool isEmpty() {
    return stack.isEmpty;
  }

  int size() {
    return stack.length;
  }

  void display() {
    if (stack.isEmpty) {
      print('stack is empty');
    } else {
      for (int i = 0; i < stack.length; i++) {
        print(stack[i]);
      }
    }
  }
}
