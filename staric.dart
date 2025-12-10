

void main(List<String> args) {
  int size = 10;
  for (int i = 0; i < size; i++) {
    int spaces = size - i - 1;
    int stars = 2 * i + 1;
    print(' ' * spaces + '*' * stars);
  }
}
