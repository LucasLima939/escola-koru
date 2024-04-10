import 'dart:convert';
import 'dart:io';

void main() {
  print('1 + 1 = ...');
  late int valor;
  try {
    valor = int.parse(stdin.readLineSync(encoding: utf8) ?? '');
  } on FormatException catch (e) {
    print(e.source);
    valor = 0;
  } on Exception catch (e) {
    print(e);
  } catch (e) {
    throw e;
    rethrow;
  }

  print(valor == 2 ? 'Yup!' : 'Nope :(');
}
