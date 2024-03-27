void main() {
  List<String> vogais = <String>["a", "e", "i", "o", "u"];

  List<String> novasVogais = [];

  // Executar operação
  vogais.forEach((element) {
    novasVogais.add(element);
  });

  print(novasVogais);
}
