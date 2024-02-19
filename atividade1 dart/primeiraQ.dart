import 'dart:io';

void main() {
  List<Funcionario> funcionarios = List.generate(5, (index) {
    print('Funcionário Nº ${index + 1} de 05:');
    print('Nome:');
    String nome = stdin.readLineSync()!;
    print('Salário:');
    double salario = double.parse(stdin.readLineSync()!);
    return Funcionario(nome, salario);
  });

  funcionarios.sort((a, b) => a.salario.compareTo(b.salario));
  imprimirFuncionarios("Funcionários em ordem crescente de salário:", funcionarios);

  funcionarios.sort((a, b) => b.salario.compareTo(a.salario));
  imprimirFuncionarios("Funcionários em ordem decrescente de salário:", funcionarios);

  funcionarios.sort((a, b) => a.nome.compareTo(b.nome));
  imprimirFuncionarios("Funcionários em ordem alfabética:", funcionarios);
}

void imprimirFuncionarios(String mensagem, List<Funcionario> funcionarios) {
  print(mensagem);
  funcionarios.forEach(print);
}

class Funcionario {
  String nome;
  double salario;

  Funcionario(this.nome, this.salario);

  @override
  String toString() => 'Nome: $nome, Salário: $salario';
}
