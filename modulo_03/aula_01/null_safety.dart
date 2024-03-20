void main() {
  // Valores Nulos -> Null-Safety
  // Add interrogação -> Nullables
  //String? nome; // String nullable
    
  List<String>? nomes;
  nomes = ['Korú'];
  
  // ! -> não está nulo
  // ? -> em caso de nulo, não executar mais nada
  // ?? -> valor padrão
  int tamanhoLista = nomes?.length ?? 0;
  print(nomes);
  print(tamanhoLista);
}