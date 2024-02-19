import 'dart:io';

void main() {
  List<int> numeros = [];

  for (int i = 0; i < 3; i++) {
    print('Digite o número ${i + 1}:');
    int numero = int.parse(stdin.readLineSync()!);
    numeros.add(numero);
  }

  numeros.sort();

  int menorNumero = numeros[0];
  int maiorNumero = numeros[numeros.length - 1];

  int quantidadeMenor = numeros.where((numero) => numero == menorNumero).length;
  int quantidadeMaior = numeros.where((numero) => numero == maiorNumero).length;

  print('Números ordenados: $numeros');

  print('Menor número: $menorNumero, aparece $quantidadeMenor vezes.');
  print('Maior número: $maiorNumero, aparece $quantidadeMaior vezes.');
}
