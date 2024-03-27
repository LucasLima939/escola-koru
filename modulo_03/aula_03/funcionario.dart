class Funcionario {
  // Encapsulamento
  String _nome;
  double _salario;
  double? _bonificacao;
  Funcionario(this._nome, this._salario, this._bonificacao);

  double _calcularSalarioTotal() => _salario + (_bonificacao ?? 0.0);

  double calcularSalarioTotal() => _calcularSalarioTotal();

  String get getNome => _nome;

  double getSalario() => _salario;

  set setNome(String novoNome) => _nome = novoNome;
}
