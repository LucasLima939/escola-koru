import 'funcionario.dart';

class Diretor implements Funcionario {
  String _nome;
  double _salario;
  double _bonificacao;
  Diretor(this._nome, this._salario, this._bonificacao);

  @override
  String get getNome => _nome;

  @override
  double calcularSalarioTotal() => _salario + _bonificacao;
  
  @override
  set setNome(String novoNome) => _nome = novoNome;
  
  @override
  double getSalario() => _salario;
}
