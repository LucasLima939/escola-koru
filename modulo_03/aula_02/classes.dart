// Sistema de compras da Boticário
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
  }
  
}

void main() {
  Pessoa cliente1 = Pessoa('Flavia', 50, 57, 'F');
  Pessoa cliente2 = Pessoa('Guilherme', 50, 57, 'M');
  // instância dos objetos
  print(cliente1.nome);
}