void main() {
  const pessoa = Pessoa("Arthur", "Pereira Furtado", 17, true , 61.0, null);
  print(pessoa);
}

// Agrupamento de variáveis
class Pessoa {
  const Pessoa(
    this.nome,
    this.sobrenome,
    this.idade,
    this.ativo,
    this.peso,
    this.nacionalidade,
  );

  // Varíaveis
  final String nome;
  final String sobrenome;
  final int idade;
  final bool ativo;
  final double peso;
  final String? nacionalidade;

  // Substitui uma implementação existente
  @override
  String toString() {
    var printFormatado = "";

    // Print com uma Formatação
    printFormatado += "Nome completo: ${nome} ${sobrenome}\n";

    if (idade >= 18) {
      printFormatado += "Idade: $idade (maior de idade)\n";
    } else {
      printFormatado += "Idade: $idade (menor de idade)\n";
    }

    if (ativo) {
      printFormatado += "Situação: Ativo\n";
    } else {
      printFormatado += "Situação: Inativo\n";
    }

    printFormatado += "Peso: ${peso.toStringAsFixed(2)}\n";

    printFormatado += "Nacionalidade: ${nacionalidade ?? 'Nao informada'}\n";

    return printFormatado;
  }
}