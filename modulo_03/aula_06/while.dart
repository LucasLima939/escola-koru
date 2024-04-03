String? chamarApi() {
  throw Exception();
}

void main() {
  String? resposta;
  int tentativas = 0;
  // Condição -> Maior liberdade
  while (resposta == null && tentativas < 5) {
    // Maior chance de erro
    try {
      resposta = chamarApi();
    } catch (e) {
      break;
    }
    tentativas++;
  }

  print(resposta);
}
