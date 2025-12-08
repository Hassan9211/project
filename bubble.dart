void main(List<String> args) {
  
  List <int> number = [30 , 20 , 10, 50 , 40];
  print('before sorting: $number');
  bubbleSort(number);
  print('after sorting: $number');
}


void bubbleSort(List <int> list){
  int n = list.length;

  for 
  (int i = 0; i < n-1; i++) {
    for
    (int j = 0 ; j < n - i - 1; j++) {
      if (list[j] > list[j+1]) {
        int temp = list[j];
        list[j] = list[j+1];
        list[j+1] = temp;
      }
    }
  }
}