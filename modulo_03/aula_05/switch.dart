void main() {
  int tamanhoEscolhido = 41;
  double? preco;
  // SWITCH/CASE: Casos bem definidos - Não usa op. relacionais
  switch(tamanhoEscolhido){
    case 38:
      preco = 300.00;
      break;
    case 39:
      preco = 310.00;
      break;
    case 40:
      preco = 320.00;
      break;
    default:
      print('Tamanho indisponível!');
      break;
  }
  
  if(preco != null){
    print(preco);    
  }
}