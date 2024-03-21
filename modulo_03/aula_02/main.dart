import 'cliente.dart';
import 'pessoa.dart';

void main(){
  Pessoa cliente1 = Pessoa('Flavia', 50, 57, 'F');
  Pessoa cliente2 = Pessoa('Guilherme', 50, 57, 'M');
  Cliente cliente3 = Cliente('email1@gmail.com', 'Adevalter', 50, 49, 'M');
  // instância dos objetos
  print(cliente3.nome);
  cliente3.comprar();
  cliente3.logarNoSistema();
}