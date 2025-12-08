// void main() {
//   // List of numbers we want to sort
//   List<int> numbers = [5, 3, 8, 4, 2];

//   print("Before Sorting: $numbers");

//   // Calling bubbleSort function and passing the list
//   bubbleSort(numbers);

//   print("After Sorting:  $numbers");
// }

// // Function to perform Bubble Sort
// void bubbleSort(List<int> list) {

//   int n = list.length;   // Total number of elements

//   // Outer loop → runs from start to second-last element
//   for (int i = 0; i < n - 1; i++) {

//     // Inner loop → compares each pair of elements
//     for (int j = 0; j < n - i - 1; j++) {

//       // If current element is bigger than next → swap
//       if (list[j] > list[j + 1]) {

//         // Swapping values using a temporary variable
//         int temp = list[j];
//         list[j] = list[j + 1];
//         list[j + 1] = temp;
//       }
//     }
//   }
// }



// void main(List<String> args) {
//   List <int> number = [5,3,8,4,2];
//   print('before sorting: $number');
//   bubbleSort(number);
//   print('after sorting: $number');

// }

// void bubbleSort(List<int> list){
//   int n = list.length;
//   for (int i = 0; i < n-1; i++) {
//     for (int j = 0; j < n-i-1; j++) {
//       if (list[j] > list[j+1]) {
//         int temp = list[j];
//         list[j] = list[j+1];
//         list[j+1] = temp;
//       }
//     }
//   }
// }

// //----quickSort-----
//  void main(List<String> args) {
//   List <int> number = [5,3,8,4,2];
//   print('before sorting: $number');
//   quickSort(number,0,number.length-1);
//   print('after sorting: $number');

// }

// void quickSort(List<int> list,int low,int high){
 
//   if (low < high) {
//     int pivot = partition(list,low,high);
//     quickSort(list,low,pivot-1);
//     quickSort(list,pivot+1,high);
//   }
// }

// int partition(List<int> list, int low, int high) {
//   int pivot = list[high];
//   int i = low - 1;

//   for (int j = low; j < high; j++) {
//     if (list[j] < pivot) {
//       i++;
//       // Swap list[i] and list[j]
//       int temp = list[i];
//       list[i] = list[j];
//       list[j] = temp;
//     }
//   }
//   // Swap list[i+1] and list[high] (pivot)
//   int temp = list[i + 1];
//   list[i + 1] = list[high];
//   list[high] = temp;
//   return i + 1;


// }
