void main() {
  double a = 10.5;
  double b = 20.3;
  double c = 30.8;

  double ab = a + b;

  print(ab);

  if (ab > c) {
    print("Soma $a + $b é maior que $c");
  } else if (ab == c) {
    print("Soma $a + $b é igual a $c");
  } else {
    print("Soma $a + $b é menor que $c");
  }
}
