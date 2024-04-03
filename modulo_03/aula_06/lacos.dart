class Pessoa {
  String nome;
  int idade;
  Pessoa(this.nome, this.idade);

  set setIdade(int value) => idade = value;
}

void main() {
  List<Pessoa> pessoas = [Pessoa('Maria', 18), Pessoa('Joãozinho', 7), Pessoa('Valentina', 12)];
  List<String> menores18 = [];

  pessoas.forEach((pessoa) {
    if (pessoa.idade < 18) {
      menores18.add(pessoa.nome);
    }
  });

  print(menores18);
}
