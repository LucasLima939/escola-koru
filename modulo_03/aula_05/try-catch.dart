enum FraganciaLilac {
  alfazema,
  lavanda,
  camomila,
  ervaDoce;
}

verificarFragancia(fragancia) {
  try {
    switch (fragancia) {
      case FraganciaLilac.alfazema:
        print('R\$ 60,90');
        break;
      case FraganciaLilac.lavanda:
        print('R\$ 65,90');
        break;
      case FraganciaLilac.camomila:
        print('R\$ 55,90');
        break;
      default:
        throw Exception();
    }
  } catch (e) {
    print('Erro! Fragância não cadastrada!');
  }
}

void main() {
  FraganciaLilac fragancia = FraganciaLilac.ervaDoce;

  verificarFragancia(fragancia);
}