void main() {
  adicionarIngrediente(ingrediente) {
    print('Adicionou o ingrediente: $ingrediente');
  }

  baterBolo() {
    print('batendo o bolo');
  }
  colocarParaAssar() {
    print('bolo pronto!');
  }

  fazerBolo(ingredientesBolo) {
    adicionarIngrediente(ingredientesBolo['ingrediente1']);
    adicionarIngrediente(ingredientesBolo['ingrediente2']);
    baterBolo();
    colocarParaAssar();
  }

  Map sacolaCompras = {
    "ingrediente1": "farinha",
    "ingrediente2": "ovos",
    "ingrediente3": "óleo",
    "ingrediente4": "leite",
  };

  fazerBolo(sacolaCompras);

}
