class Funcionario {
  // Encapsulamento
  String? _nome;
  Funcionario(this._nome);
  
  String? get getNome => _nome;
  
  set setNome(String novoNome) => _nome = novoNome;
}

void main() {
  // Polimorfismo
  Funcionario funcionario1 = Funcionario('Guilherme');

  print(funcionario1.getNome);
  
  funcionario1.setNome = 'Willian';
}