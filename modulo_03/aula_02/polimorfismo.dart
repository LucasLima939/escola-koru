// Sistema de compras da Boticário
class Pessoa {
  // Construtor
  Pessoa(this.nome, this.peso, this.idade,{this.sexo});
  // 1º Características essenciais
  // 2º Características úteis no sistema
  // Propriedades de Pessoas
  String? sexo;
  String nome;
  double peso;
  int idade;
  // Métodos de Pessoas
  comprar(){
    print('Cliente $nome comprou!');
  }
  
}
// 1º Tipo de herança: extends -> recebe tudo
class Cliente extends Pessoa {
  String email;
  Cliente(this.email, super.nome, super.peso, super.idade,{super.sexo});
  
  logarNoSistema(){
    print('logou no sistema');
  }  
}

class Funcionario implements Pessoa {  
  String? cargo;
  @override
  String nome;
  @override
  double peso;
  @override
  int idade;
  @override
  String? sexo;
  Funcionario(this.nome, this.peso, this.idade, {this.sexo, this.cargo});
  
  @override
  comprar(){
    print('Funcionario $nome comprou!');
  }
}

class Diretor extends Funcionario {
  Diretor(super.nome, super.peso, super.idade,{super.sexo}) : super(cargo: 'Diretor');   
}

class Presidente extends Funcionario {
  Presidente(super.nome, super.peso, super.idade,{super.sexo}) : super(cargo: 'Presidente'); 
}

void main() {
  // Polimorfismo
  Funcionario funcionario1 = Presidente('Guilherme', 50, 57);
  print(funcionario1.cargo);
}
