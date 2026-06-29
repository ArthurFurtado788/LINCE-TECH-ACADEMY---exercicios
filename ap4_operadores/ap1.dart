bool ehAnoBissexto(int ano) {
   return (ano % 4 == 0 && ano % 100 != 0) || (ano % 400 == 0);
}

void main() {
   List<int> anos = [2016, 1988, 2000, 2100, 2300, 1993];
 
  for (int ano in anos) {
    if (ehAnoBissexto(ano)) {
      print('O ano $ano é bissexto');
    } else {
      print('O ano $ano nao é bissexto');
    }
  }
}
