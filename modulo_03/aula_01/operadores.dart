/**

Operadores
Operadores aritméticos:
+ (adição)
- (subtração)
* (multiplicação)
/ (divisão)
% (resto da divisão)

operadores relacionais:
== (igual a)
!= (diferente de)
> (maior que)
< (menor que)
>= (maior ou igual a)
<= (menor ou igual a)

operadores lógicos
&& (E lógico - Ambos precisam ser verdadeiros)
|| (OU lógico - Apenas um precisa ser verdadeiro)
! (NÃO lógico - Oposto do valor atual)

operadores de atribuição
= (atribuição simples)
+= (adição e atribuição)
-= (subtração e atribuição)
*= (multiplicação e atribuição)
/= (divisão e atribuição)
++ (incremento)
-- (decremento)

*/

main() {
  // soma é igual a 11
  var soma = 4 + 7;
  print('o resultado de soma é ${soma}');

  // subtracao é igual a 7
  var subtracao = 11 - 4;
  print('o resultado de subtração é ${subtracao}');

  // inversao é igual a 5(positivo)
  var inversao = -(-5);
  print('o resultado de inversão é ${inversao}');

  // multiplicacao é igual a 15
  var multiplicacao = 5 * 3;
  print('o resultado de multiplicacao é ${multiplicacao}');

  // divisao é igual a 4
 var divisao = 16 / 4;
  print('o resultado de divisão é ${divisao}');

  // divisao_resultado_inteiro é igual a 2
  var divisao_resultado_inteiro = 5 ~/ 2;
 print('o resultado inteiro de divisão é ${divisao_resultado_inteiro}');

// modulo é igual a 1
var modulo = 9 % 2;
print('o resto de divisão(modulo) é ${modulo}');
}