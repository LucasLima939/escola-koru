void main(){
  // String, int, double, bool, List, Map
  Map<String, String> estados = {'PE': 'Pernambuco', 'SP': 'São Paulo'};

  estados['RJ'] = 'Rio de Janeiro';

  Map<String, int> salariosBase = {'funcionario1': 2000, 'funcionario2': 3000};

  List<int> inteiros = [0, 1, 2, 3];

  Map<String, double> localizacao = {"lontitude": 1000.00, "latitude": 210020.00};
  Map<int, int> dicionario = Map.fromIterable(inteiros, key: (element) => element, value: (element) => element * 2);

  List<String> index = ["1", "2", "3"];

  List<double> numeros = index.map((element) => double.parse(element)).toList();

  String value = "true";

  bool resultado = value == "true";

  print(numeros);
}