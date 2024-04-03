void main() {
  List<String> alunos = ['Jair', 'Jaqueline', 'Marcos']; // Tamanho: 3; últ. posição: 2

  // Inicialização, Condição, Ação (incremento)
  for (int i = 0; i < alunos.length; i++) {
    print(alunos[i]);
  }
  
  // Listas
  alunos.forEach((aluno) {
    print(aluno);
  });

  for (String aluno in alunos) {
    print(aluno);
  }
}
