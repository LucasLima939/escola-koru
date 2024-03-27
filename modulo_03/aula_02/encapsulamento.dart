class Funcionario {
  // Encapsulamento
  String _nome;
  double _salario;
  double _bonificacao;
  Funcionario(this._nome, this._salario, this._bonificacao);

  double _calcularSalarioTotal() => _salario + _bonificacao;

  double calcularSalarioTotal() => _calcularSalarioTotal();
  
  String get getNome => _nome;
  
  set setNome(String novoNome) => _nome = novoNome;
}

void main() {
  Funcionario funcionario1 = Funcionario('Guilherme', 3000, 500);

  print(funcionario1.getNome);
  print(funcionario1.calcularSalarioTotal());
  
  //funcionario1.setNome = 'Willian';
}