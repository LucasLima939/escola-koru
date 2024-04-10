void main(){
  String nome = " Escola Korú @ 2024 ";

  print(nome);

  nome = nome.replaceAll(RegExp('[a-zA-Z]'), ''); // remove normal characters
  //nome = nome.replaceAll(RegExp('[a-zA-Z\xC0-\uFFFF]'), ''); // remove char. with accent
  //nome = nome.replaceAll(RegExp('[0-9]'), ''); // remove numbers only
  //nome = nome.replaceAll(RegExp('[a-zA-Z0-9]'), ''); // remove normal char. & numbers
  //nome = nome.replaceAll(RegExp(r'\s+'), ''); // remove spaces only
  //nome = nome.trim(); // remove spaces from borders
  //nome = nome.replaceAll(RegExp(r'[^\w\s]+'), ''); // remove symbols only

  print(nome);
}
