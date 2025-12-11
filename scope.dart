void main(List<String> args) {
  
  
  DoublyLinkedList<int> list = DoublyLinkedList<int>();

  list.insertAtStart(10);
  list.insertAtEnd(20);
  list.insertAtEnd(30);
  list.insertAt(1, 15);

  print("Forward:");
  list.displayForward();

  print("\nBackward:");
  list.displayBackward();

  list.delete(20);

  print("\nAfter deleting 20:");
  list.displayForward();
}



class DoublyLinkedList<T> {
  Node <T>? head;
  Node<T>? tail;
  int size = 0;

  // Insert at start
  void insertAtStart(T data) {
    Node<T> newNode = Node(data);

    if (head == null) {
      head = tail = newNode;
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
    size++;
  }

  // Insert at end
  void insertAtEnd(T data) {
    Node<T> newNode = Node(data);

    if (tail == null) {
      head = tail = newNode;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
    size++;
  }

  // Insert at specific index
  void insertAt(int index, T data) {
    if (index < 0 || index > size) {
      print("Invalid index");
      return;
    }

    if (index == 0) {
      insertAtStart(data);
      return;
    }

    if (index == size) {
      insertAtEnd(data);
      return;
    }

    Node<T> newNode = Node(data);
    Node<T>? current = head;

    for (int i = 0; i < index - 1; i++) {
      current = current!.next;
    }

    newNode.next = current!.next;
    newNode.prev = current;
    current.next!.prev = newNode;
    current.next = newNode;

    size++;
  }

  // Delete a node
  void delete(T data) {
    if (head == null) return;

    Node<T>? current = head;

    while (current != null && current.data != data) {
      current = current.next;
    }

    if (current == null) return;

    if (current == head) {
      head = head!.next;
      if (head != null) head!.prev = null;
    } else if (current == tail) {
      tail = tail!.prev;
      if (tail != null) tail!.next = null;
    } else {
      current.prev!.next = current.next;
      current.next!.prev = current.prev;
    }

    size--;
  }

  // Traverse forward
  void displayForward() {
    Node<T>? current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  // Traverse backward
  void displayBackward() {
    Node<T>? current = tail;
    while (current != null) {
      print(current.data);
      current = current.prev;
    }
  }
}

class Node<T> {
  T data;
  Node<T>? next;
  Node<T>? prev;
  Node(this.data);
}
