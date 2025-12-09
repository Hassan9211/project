void main(List<String> args) {
  Queue queue = Queue();

  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);
  queue.enqueue(4);
  queue.enqueue(5);
  queue.display();
  queue.dequeue();
  queue.dequeue();
  queue.display();
  queue.enqueue(2);
  queue.enqueue(1);
  queue.display();
 
}

class Queue {
  List<int> queue = [];

  void enqueue(int value) {
    queue.add(value);
  }

  int dequeue() {
    if (queue.isEmpty) {
      throw Exception("Queue is empty");
    }
    return queue.removeAt(0);
  }

  int peek() {
    if (queue.isEmpty) {
      throw Exception("Queue is empty");
    }
    return queue.first;
  }

  bool isEmpty() {
    return queue.isEmpty;
  }

  int size() {
    return queue.length;
  }

  void display() {
    if (queue.isEmpty) {
      print("Queue is empty");
    } else {
      for (int i = 0; i < queue.length; i++) {
        print(queue[i]);
      }
    }
  }
}
