import 'funcionario.dart';

class Presidente extends Funcionario {
  Presidente(super.nome, super.salario, super.bonificacao);

  double get salario => super.getSalario();
}
