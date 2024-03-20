/**
dynamic
String
int
double
bool
List
Map
Null-Safety

Declarações
var, final e const
*/

void main(){
  // dynamic
  // String
  String nome = "Escola Korú";
  String cpf = "02102120";
  // int
  int idade = 21;
  // double
  double preco = 9; // -> 9.00
  // bool
  bool maiorDeIdade = false; // true ou false
  // List
  List<String> vogais = <String>["a", "e", "i", "o", "u"];
  //vogais[1] = "a"; // atribuir novo valor
  //print(vogais);
  //print(vogais[1]); // posição 0
  //print(vogais.length); // quantidade = 5

  //vogais.add("korú"); // adicionar no final
  vogais.insert(3, "Korú");
  //print(vogais);
  //print(vogais.length);

  Map<String, dynamic> dicionario = <String, dynamic>{
    'Nome': 'Korú',
    'Turma': 100,
    'Valor': [1,2,3]
  };
  // Combinação chave-valor
  //dicionario.addAll({'Turma': 'Flutter'});
  //dicionario['Turma'] = 'Flutter';
  print(dicionario);
  print(dicionario['Turma']);

  // Declaração 'var' -> pode ser modificado
  String nome1 = "Korú";
  nome1 = "Escola";
  // Declaração 'final' -> não pode ser modificada
  final String nomeEscola = "Korú";
  // Declaração 'const' -> constantes do sistema
  const String ambiente = "Desenvolvimento";
  // Declaração 'late' -> será inicializada
  late int idade1;
  idade1 = 21;
}