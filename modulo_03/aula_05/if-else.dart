void main() {
  double nota = 10.0;
  
  if(nota >= 10.0){
    print("Parabéns!");
    print("Aprovado!");    
  } else if (nota >= 7.0){    
    print("Aprovado!");
  } else if (nota >= 3.0) {
    print("Recuperação...  :/");
  } else {
    print("Reprovado... :(");
  }
  
  print("Fim");
}