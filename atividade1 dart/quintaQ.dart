import 'dart:io';

void main() {
  List<int> numeros = [];

  print('Digite 15 números:');
  for (int i = 0; i < 3; i++) {
    print("digite o ${i + 1}º número:"); //
    int numero = int.parse(stdin.readLineSync()!);
    if (!numeros.contains(numero)) numeros.add(numero);
  }

  numeros.sort();

  print('\nDigite um número para verificar se está no vetor:');
  int numeroUsuario = int.parse(stdin.readLineSync()!);

  int posicaoSequencial = numeros.indexOf(numeroUsuario) + 1;
  print(posicaoSequencial != 0
      ? '$numeroUsuario está na posição $posicaoSequencial (índice ${posicaoSequencial - 1}).'
      : '$numeroUsuario não está no vetor.');

  int posicaoBinaria = numeros.indexOf(numeroUsuario, 0);
  print(posicaoBinaria != -1
      ? '$numeroUsuario está na posição ${posicaoBinaria + 1} (índice $posicaoBinaria).'
      : '$numeroUsuario não está no vetor.');
}
