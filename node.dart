void main(List<String> args) {
  nodeLinkedList list = nodeLinkedList();
  list.addNode(1);
  list.addNode(2);
  list.addNode(3);
  list.addNode(4);
  list.addNode(5);
  list.display();
  print('list size: ${list.size}');
}

class Node<T> {
  T data;
  Node<T>? next;

  Node(this.data);
}

class nodeLinkedList {
  Node<int>? head;
  Node<int>? tail;
  int size = 0;

  void addNode(int data) {
    Node<int> newNode = Node(data);
    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      tail!.next = newNode;
      tail = newNode;
    }
    size++;
  }

  void display() {
    Node? temp = head;
    if (temp == null) {
      print('Linked list is empty');
    } else {
      while (temp != null) {
        print(temp.data);
        temp = temp.next;
      }
    }
  }
}
