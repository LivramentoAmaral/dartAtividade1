import 'dart:io';

class Aluno {
  String nome;
  double nota1;
  double nota2;

  Aluno(this.nome, this.nota1, this.nota2);

  double calcularMediaPonderada() {
    return (nota1 * 2 + nota2 * 3) / 5;
  }

  @override
  String toString() => 'Nome: $nome, Média Ponderada: ${calcularMediaPonderada()}';
}

void main() {
  List<Aluno> alunos = List.generate(8, (_) {
    print('Aluno Nº ${_ + 1} de 8:\nNome:');
    String nome = stdin.readLineSync()!;
    print('Nota 1:');
    double nota1 = double.parse(stdin.readLineSync()!);
    print('Nota 2:');
    double nota2 = double.parse(stdin.readLineSync()!);
    return Aluno(nome, nota1, nota2);
  });

  // Ordenar alunos pela média ponderada
  alunos.sort((a, b) => b.calcularMediaPonderada().compareTo(a.calcularMediaPonderada()));

  // Listar alunos ordenados pela média ponderada
  print('\nAlunos ordenados pela média ponderada:');
  alunos.forEach(print);

  // Ordenar alunos pela nota 1
  alunos.sort((a, b) => a.nota1.compareTo(b.nota1));

  // Listar alunos ordenados pela nota 1
  print('\nAlunos ordenados pela nota 1:');
  alunos.forEach(print);

  // Listar alunos reprovados (média < 7) em ordem alfabética
  List<Aluno> reprovados = alunos.where((aluno) => aluno.calcularMediaPonderada() < 7).toList();
  reprovados.sort((a, b) => a.nome.compareTo(b.nome));

  print('\nAlunos reprovados em ordem alfabética:');
  reprovados.forEach(print);
}
