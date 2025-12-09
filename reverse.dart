void main(List<String> args) {
  int num = 12345567789;

  String numStr = num.toString();
  String reversedStr = numStr.split('').reversed.join('');
  int reversed = int.parse(reversedStr);

  print(reversed);
}
