void main(){
  List<String> vogais = <String>["a", "e", "i", "o", "u"];
  vogais.add("u");

  List<int> numeros = List.empty(growable: true);
  numeros.add(20);
  numeros.add(10);
  numeros.add(0);

  // var, final, const, late
  // Tipos primitivos: String, int, double, bool, List, Map(chave, valor)

  List novasVogais = List.filled(5, "a", growable: true);

  List novosNumeros = List.from(numeros);

  List<int> contador = List.generate(5, ((index) => index)); // index: 0, 1, 2, 3, 4

  List<int> contadorNovo = List<int>.of(contador.map((element) => element + 2), growable: true);

  List vogaisNaoModificadas = List.unmodifiable(vogais);

  print(contadorNovo);
}