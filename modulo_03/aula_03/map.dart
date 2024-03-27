void main() {
  List<String> vogais = <String>["a", "e", "i", "o", "u"];
  List<String> alunos = <String>[
    "adriana",
    "arlan",
    "willian",
  ];
  //print(vogais);
  //print(alunos);
  // Transformar a lista
  List<bool> conversaoAlunos = vogais.map((vogal) {
    return alunos.any((aluno) => aluno.startsWith(vogal));
  }).toList();

  //print(conversaoAlunos);

  alunos.contains("vinicius");

  alunos.every((aluno) => aluno.isNotEmpty);

  print("Nome alunos: " + alunos.join(", "));

  //alunos.remove("arlan");

  alunos.sort((a, b) => a.length.compareTo(b.length));

  //final novosAlunos = alunos.takeWhile((aluno) => aluno.startsWith("w"));


  List<String> novosAlunos = <String>[
    "inês",
    "inocêncio",
  ];

  var result = novosAlunos.where((element) => element.length > 5);

  print(result);
}
