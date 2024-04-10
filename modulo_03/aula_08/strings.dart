void main() {
  String nome = "Korú";

  // print(nome.isEmpty);
  // print(nome.isNotEmpty);

  //print(nome.length);

  //nome = nome.replaceAll(RegExp(r'Escola'), 'Faculdade'); // RegEx
  //nome.trim();
  //nome.split(',');
  nome == 'Korú';
  nome.compareTo('iPhone') == 0;
  //nome.contains('B');
  //nome.contains(RegExp('[A-Z]'));
  nome = nome.replaceAllMapped(RegExp(r'o'), ((match) => match.start == 3 ? ' ' : 'o')); // Arrow function + Ternário
  // nome = nome.replaceFirst(RegExp(r'o'), ' ');
  //nome = nome.replaceRange(0, 4, '');

  //nome = nome.toUpperCase();
  //nome = nome.toLowerCase();

  //nome = nome.substring(0, 4);

  print(nome);
}
