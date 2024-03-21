import 'pessoa.dart';

class Cliente extends Pessoa {
  String email;
  Cliente(this.email, super.nome, super.peso, super.idade, super.sexo);
  
  logarNoSistema(){
    print('logou no sistema');
  }  
}