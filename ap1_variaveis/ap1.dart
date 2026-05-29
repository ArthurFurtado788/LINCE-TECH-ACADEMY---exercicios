void main() {
  var nome = "Arthur";
  var sobrenome = "Pereira Furtado";
  var idade = 17;
  bool ativo = true;
  var peso = 61.00;
  String? nacionalidade;

  print("Nome completo: ${nome} ${sobrenome}");

  if(idade >= 18) {
    print("Idade: ${idade} anos, você é maior de idade!");
  } else {
    print("Idade: ${idade} anos, você é menor de idade!");
  }

  if(ativo) {
    print("Situação: ATIVO!");
  } else {
    print("Situação: INATIVO!");
  }

  print("Peso: ${peso.toStringAsFixed(2)}kg");

  print("Nacionalidade: ${nacionalidade ?? 'Não informada'}");
}