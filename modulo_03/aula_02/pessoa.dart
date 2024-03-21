class Pessoa {
  // Construtor
  Pessoa(this.nome, this.peso, this.idade, this.sexo);
  // 1º Características essenciais
  // 2º Características úteis no sistema
  // Propriedades de Pessoas
  String sexo;
  String nome;
  double peso;
  int idade;
  // Métodos de Pessoas
  comprar(){
    print('Cliente $nome comprou!');
  }
  
}