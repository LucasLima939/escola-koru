String chamarApi(){
  return "Reposta de sucesso";
}

void main(){
  String? resposta = "Reposta padrão";

  print(resposta);
  do {
    resposta = chamarApi();
  } while (resposta == null);

  print(resposta);
}