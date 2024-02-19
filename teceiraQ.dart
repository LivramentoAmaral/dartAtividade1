import 'dart:io';

class Produto {
  int codigo;
  String descricao;
  double preco;

  Produto(this.codigo, this.descricao, this.preco);

  @override
  String toString() => 'Código: $codigo, Descrição: $descricao, Preço: $preco';
}

void main() {
  List<Produto> produtos = List.generate(2, (_) {
    print('Produto Nº ${_ + 1} de 12:\nCódigo:');
    int codigo = int.parse(stdin.readLineSync()!);
    print('Descrição:');
    String descricao = stdin.readLineSync()!;
    print('Preço:');
    double preco = double.parse(stdin.readLineSync()!);
    return Produto(codigo, descricao, preco);
  })..sort((a, b) => a.codigo.compareTo(b.codigo));

  print('\nBusca Sequencial:');
  int codigoSequencial = int.parse(stdin.readLineSync()!);
  int comparacoesSequencial = buscaSequencial(produtos, codigoSequencial);
  print('Número de comparações na busca sequencial: $comparacoesSequencial');

  print('\nBusca Binária:');
  int codigoBinaria = int.parse(stdin.readLineSync()!);
  int comparacoesBinaria = buscaBinaria(produtos, codigoBinaria);
  print('Número de comparações na busca binária: $comparacoesBinaria');
}

int buscaSequencial(List<Produto> produtos, int codigo) {
  int comparacoes = 0;
  for (var produto in produtos) {
    comparacoes++;
    if (produto.codigo == codigo) {
      print('Produto encontrado: $produto');
      return comparacoes;
    }
  }
  print('Produto não encontrado.');
  return comparacoes;
}

int buscaBinaria(List<Produto> produtos, int codigo) {
  int comparacoes = 0;
  int inicio = 0, fim = produtos.length - 1;

  while (inicio <= fim) {
    comparacoes++;
    int meio = (inicio + fim) ~/ 2;

    if (produtos[meio].codigo == codigo) {
      print('Produto encontrado: ${produtos[meio]}');
      return comparacoes;
    } else if (produtos[meio].codigo < codigo) {
      inicio = meio + 1;
    } else {
      fim = meio - 1;
    }
  }

  print('Produto não encontrado.');
  return comparacoes;
}
