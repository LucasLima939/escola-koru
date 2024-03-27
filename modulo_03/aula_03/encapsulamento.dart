import 'diretor.dart';
import 'funcionario.dart';

void main() {
  Funcionario funcionario1 = Funcionario('Guilherme', 3000, 500);

  print(funcionario1.getNome);
  print(funcionario1.calcularSalarioTotal());
  
  //funcionario1.setNome = 'Willian';
}