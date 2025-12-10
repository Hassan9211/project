
void main(List<String> args) {
  singalyLinkedList list = singalyLinkedList();
  list.addNode(1);
  list.addNode(2);
  list.addNode(3);
  list.addNode(4);
  list.display();
  
  
}


class Node{
  int data;
  Node? next;

  Node(this.data);
  

}

class singalyLinkedList{
  Node? head;

  void addNode(int data){
    Node newNode = Node(data);
    if(head == null){
      head = newNode;
    }
    else{
      Node? temp = head;
      while(temp!.next != null){
        temp = temp.next;
      }
      temp.next = newNode;
    }
  }

  void display(){
    Node? temp = head;
    while(temp != null){
      print(temp.data);
      temp = temp.next;
    }

  }
}