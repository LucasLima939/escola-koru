Map<String, dynamic> obj1 = {
  "nome": "Vinicius",
  "idade": 31,
  "cidade": "Salvador",
};

Map<String, dynamic> obj2 = {
  "nome": "Guilherme",
  "idade": 31,
  "cidade": "Salvador",
};

class Pessoa {
  String nome;
  int idade;
  String cidade;

  Pessoa(this.nome, this.idade, this.cidade);

  Pessoa.fromJson(Map<String, dynamic> json)
      : nome = json['nome'],
        idade = json['idade'],
        cidade = json['cidade'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'nome': nome,
        'idade': idade,
        'cidade': cidade,
      };
}

void main() {
  Pessoa vinicius = Pessoa('Vinicius', 31, 'Salvador');

  print(vinicius.toJson());
}
