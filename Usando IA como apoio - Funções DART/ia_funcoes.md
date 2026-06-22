# IA como Apoio – Funções em Dart

> **Atividade:** Lince Tech Academy – Usando IA como apoio
> **Tema:** Funções em Dart (introdução, parâmetros, retorno, funções como objeto e parâmetro)
> **Objetivo:** Registrar a interação com IA e documentar observações críticas sobre as respostas geradas.

---

## 1. Quais cuidados devo ter ao criar funções em Dart?

**Pergunta feita à IA:**
> Quais cuidados devo ter ao criar funções em Dart?

**Resposta resumida da IA:**

- **Nomear com clareza:** O nome deve descrever exatamente o que a função faz — `calcularDesconto` é melhor que `calc` ou `fazer`.
- **Responsabilidade única:** Cada função deve fazer uma coisa só. Se a função começa a fazer várias coisas, é sinal de que deve ser dividida.
- **Tipar os parâmetros e o retorno:** Evita surpresas em runtime e documenta o comportamento esperado.
- **Evitar efeitos colaterais desnecessários:** Uma função que só lê dados e retorna um resultado é mais previsível do que uma que altera variáveis externas.
- **Manter o tamanho razoável:** Funções muito longas são difíceis de ler e testar. Se passou de 20–30 linhas, considere refatorar.
- **Documentar quando necessário:** Use `///` para gerar documentação automática no Dart.

**Minha observação:**

O princípio de responsabilidade única foi o que mais me impactou. É fácil ir adicionando coisas dentro de uma função e ela vai crescendo sem controle. Pensar "essa função faz exatamente uma coisa?" antes de escrever ajuda bastante. Tipar sempre os parâmetros e o retorno também é um hábito que quero cultivar — deixa o código muito mais legível e o editor consegue ajudar melhor com autocomplete e erros.

---

## 2. Posso chamar minha função dentro dela mesma?

**Pergunta feita à IA:**
> Posso chamar minha função dentro dela mesma?

**Resposta resumida da IA:**

Sim, isso se chama **recursão**. Uma função pode chamar a si mesma, mas é necessário ter uma **condição de parada** (caso base), senão o programa entra em loop infinito e lança um `Stack Overflow Error`.

Exemplo clássico — fatorial:

```dart
int fatorial(int n) {
  if (n <= 1) return 1; // condição de parada
  return n * fatorial(n - 1); // chamada recursiva
}

void main() {
  print(fatorial(5)); // 120
}
```

- **Caso base:** `n <= 1` — para a recursão
- **Caso recursivo:** `n * fatorial(n - 1)` — reduz o problema a cada chamada

**Minha observação:**

Recursão parece complicado de início, mas a lógica é elegante: você define o menor caso possível e deixa a função se chamar até chegar lá. O risco está em esquecer o caso base — sem ele, a função nunca para. É um recurso poderoso, mas para casos simples um loop `for` costuma ser mais legível e eficiente em termos de memória, já que cada chamada recursiva ocupa espaço na pilha.

---

## 3. Existe limite de parâmetros a serem recebidos em uma função?

**Pergunta feita à IA:**
> Existe limite de parâmetros a serem recebidos em uma função?

**Resposta resumida da IA:**

Tecnicamente, **não há um limite fixo** imposto pelo Dart. A linguagem permite qualquer quantidade de parâmetros. Porém, na prática:

- Funções com **mais de 3–4 parâmetros** ficam difíceis de usar e entender.
- É recomendado agrupar parâmetros relacionados em uma **classe ou Map** quando há muitos.
- Parâmetros nomeados (`{}`) ajudam quando há vários, pois deixam claro o que cada um representa na chamada.

Exemplo de refatoração:

```dart
// Ruim — muitos parâmetros posicionais
void criarUsuario(String nome, int idade, String email, String cidade, String pais) { ... }

// Melhor — parâmetros nomeados
void criarUsuario({
  required String nome,
  required int idade,
  required String email,
  String cidade = '',
  String pais = 'Brasil',
}) { ... }

// Ainda melhor — criar uma classe Usuario
void criarUsuario(Usuario usuario) { ... }
```

**Minha observação:**

Faz sentido não ter limite técnico, mas o limite prático existe por legibilidade. Já vi funções com 6, 7 parâmetros posicionais e é impossível saber o que cada argumento significa sem olhar a definição. Parâmetros nomeados resolvem isso parcialmente, mas quando há muitos dados relacionados, criar uma classe é a solução mais limpa.

---

## 4. É recomendado usar `dynamic` nos parâmetros de uma função?

**Pergunta feita à IA:**
> É recomendado usar dynamic nos parâmetros de uma função?

**Resposta resumida da IA:**

**Não é recomendado** na maioria dos casos. Usar `dynamic` desativa a verificação de tipos em tempo de compilação, o que significa:

- Erros que poderiam ser detectados antes de rodar o código só aparecem em runtime.
- O editor perde a capacidade de sugerir métodos e propriedades.
- O código fica mais difícil de entender — não fica claro o que a função espera receber.

**Quando pode ser aceitável:**

- Ao trabalhar com JSON de estrutura desconhecida.
- Em situações de serialização/deserialização genérica.
- Quando se usa `Object` ou genéricos (`T`) em vez de `dynamic`, o Dart ainda mantém alguma segurança.

```dart
// Evitar
void processar(dynamic valor) { ... }

// Preferir
void processar(String valor) { ... }

// Quando realmente precisa de flexibilidade — use genérico
void processar<T>(T valor) { ... }
```

**Minha observação:**

A lição aqui é a mesma de variáveis: `dynamic` é uma saída fácil que cria problemas maiores no futuro. Prefiro ser explícito com o tipo. Se a função precisa aceitar tipos diferentes, genéricos (`<T>`) são a solução correta — mantêm a flexibilidade sem abrir mão da segurança de tipos.

---

## 5. Quando usar os operadores de valores opcionais e valores requeridos em uma função Dart?

**Pergunta feita à IA:**
> Quando usar os operadores de valores opcionais e valores requeridos em uma função Dart?

**Resposta resumida da IA:**

Em Dart, parâmetros nomeados dentro de `{}` são **opcionais por padrão**. Para torná-los obrigatórios, usamos `required`.

| Situação | Usar |
|---|---|
| O parâmetro é sempre necessário para a função funcionar | `required` |
| O parâmetro tem um valor padrão que faz sentido | Opcional com `= valorPadrao` |
| O parâmetro pode ser null e a função lida com isso | Opcional sem valor padrão (`String?`) |

```dart
void enviarEmail({
  required String destinatario,   // sempre necessário
  required String assunto,        // sempre necessário
  String corpo = '',              // opcional com valor padrão
  bool copiaOculta = false,       // opcional com valor padrão
  String? responderPara,          // opcional, pode ser null
}) {
  // ...
}
```

**Minha observação:**

A regra que uso: se a função não faz sentido sem aquele dado, use `required`. Se existe um valor padrão razoável que cobre a maioria dos casos, use opcional com default. Usar `required` em tudo sem necessidade obriga o chamador a sempre passar valores que nem sempre importam — isso torna o uso da função chato.

---

## 6. O que são parâmetros nomeados em uma função?

**Pergunta feita à IA:**
> O que são parâmetros nomeados em uma função?

**Resposta resumida da IA:**

Parâmetros nomeados são declarados entre chaves `{}` e precisam ser informados pelo nome na hora da chamada, e não pela posição.

```dart
// Parâmetros posicionais — ordem importa
void somar(int a, int b) => print(a + b);
somar(3, 5); // 3 e 5 vão para a e b pela posição

// Parâmetros nomeados — nome importa, ordem não
void saudar({required String nome, String saudacao = 'Olá'}) {
  print('$saudacao, $nome!');
}
saudar(nome: 'Arthur');              // Olá, Arthur!
saudar(saudacao: 'Oi', nome: 'Ana'); // Oi, Ana! (ordem não importa)
```

**Vantagens:**
- Código mais legível na chamada da função.
- Não é necessário lembrar a ordem dos argumentos.
- Permite valores padrão facilmente.

**Minha observação:**

Parâmetros nomeados são especialmente úteis quando a função tem vários parâmetros. Sem eles, ver `criarConta(true, false, true, 30)` não diz nada — é necessário ir até a definição para entender o que cada `true` significa. Com nomeados, fica `criarConta(ativo: true, admin: false, verificado: true, idade: 30)` — muito mais claro.

---

## 7. Quais métodos existem para variáveis do tipo `Function` em Dart?

**Pergunta feita à IA:**
> Quais métodos existem para variáveis do tipo Function em Dart?

**Resposta resumida da IA:**

O tipo `Function` em Dart é relativamente simples — não possui muitos métodos como listas ou strings. Os principais recursos são:

- **`.call(...)`** — chama a função com os argumentos fornecidos. Equivalente a chamar a função diretamente.
- **Verificação com `is Function`** — testa se uma variável é do tipo função.
- **Armazenar e passar como argumento** — funções são objetos de primeira classe.

```dart
void ola() => print('Olá!');

void main() {
  Function minhaFuncao = ola;

  minhaFuncao();          // chama diretamente
  minhaFuncao.call();     // equivalente ao de cima

  print(minhaFuncao is Function); // true

  // Passando como parâmetro
  executar(minhaFuncao);
}

void executar(Function fn) {
  fn();
}
```

**Minha observação:**

Diferente de linguagens onde funções são cidadãos de segunda classe, no Dart elas podem ser armazenadas em variáveis, passadas como argumento e retornadas por outras funções. O `.call()` existe mas raramente é necessário — chamar `minhaFuncao()` já é mais direto. O ponto mais útil aqui é entender que `Function` como tipo é genérico demais; prefiro usar assinaturas como `void Function(String)` para ser preciso.

---

## 8. Qual a diferença entre `olaMundo` e `olaMundo()` ao chamar uma função?

**Pergunta feita à IA:**
> Qual a diferença entre chamar minha função chamada olaMundo das formas "olaMundo" e "olaMundo()".

**Resposta resumida da IA:**

- **`olaMundo`** — referência à função. Você está apontando para o objeto função, sem executá-lo.
- **`olaMundo()`** — execução da função. Os parênteses disparam a chamada e o código dentro é executado.

```dart
void olaMundo() {
  print('Olá, mundo!');
}

void main() {
  var referencia = olaMundo;   // guarda a referência, NÃO executa
  referencia();                // agora sim — executa

  olaMundo;                    // nada acontece — só referencia
  olaMundo();                  // imprime "Olá, mundo!"

  // Útil para passar funções como argumento
  List<String> nomes = ['Ana', 'Bob', 'Carlos'];
  nomes.forEach(print);        // passa a referência de print, não print()
}
```

**Minha observação:**

Essa distinção é uma das mais importantes para entender programação funcional em Dart. `nomes.forEach(print)` funciona porque `print` sem parênteses é uma referência à função — o `forEach` vai chamá-la internamente para cada elemento. Se eu escrevesse `nomes.forEach(print())`, estaria passando o *resultado* de chamar `print()` sem argumento, o que causaria um erro. É sutil, mas muito importante.

---

## 9. Mostre exemplos de uma função tratando strings com seus diferentes métodos

**Pergunta feita à IA:**
> Mostre exemplos de uma função tratando strings com seus diferentes métodos.

**Resposta resumida da IA:**

```dart
void demonstrarStrings(String texto) {
  print(texto.toUpperCase());          // TRANSFORMA EM MAIÚSCULO
  print(texto.toLowerCase());          // transforma em minúsculo
  print(texto.trim());                 // remove espaços nas bordas
  print(texto.contains('Dart'));       // true/false se contém substring
  print(texto.replaceAll('a', '@'));   // substitui todas as ocorrências
  print(texto.split(' '));             // divide em lista por separador
  print(texto.startsWith('Olá'));      // true/false
  print(texto.endsWith('!'));          // true/false
  print(texto.length);                 // tamanho da string
  print(texto.substring(0, 3));        // parte da string
  print(texto.indexOf('Dart'));        // posição da substring
  print(texto.isEmpty);               // true se vazia
}

void main() {
  demonstrarStrings('  Olá, Dart!  ');
}
```

**Minha implementação após entender os exemplos:**

```dart
String formatarNomeCompleto(String nome) {
  return nome
      .trim()
      .split(' ')
      .map((parte) => parte[0].toUpperCase() + parte.substring(1).toLowerCase())
      .join(' ');
}

void main() {
  print(formatarNomeCompleto('  arthur henrique furtado  ')); 
  // Arthur Henrique Furtado
}
```

**Minha observação:**

Encadear métodos de string é muito poderoso. O exemplo que criei pega um nome com espaços extras e capitalização incorreta e o corrige completamente — tudo em uma função com 4 linhas. O `split` + `map` + `join` é uma combinação muito útil para processar texto.

---

## 10. Traga exemplos de mau uso de funções

**Pergunta feita à IA:**
> Traga exemplos de mau uso de funções.

**Resposta resumida da IA:**

**1. Função fazendo coisas demais:**
```dart
// Ruim — uma função que faz tudo
void processarPedido(String produto, int quantidade, String cliente) {
  // valida o estoque
  // desconta do estoque
  // calcula o preço
  // aplica desconto
  // envia e-mail
  // registra no banco
  // imprime nota fiscal
}
```

**2. Nome que não descreve o que faz:**
```dart
void fazer(String x) { ... }     // o que faz? com o quê?
void processa(dynamic d) { ... } // muito genérico
```

**3. Parâmetros desnecessários ou mal tipados:**
```dart
// Ruim — recebe dynamic sem motivo
void calcularIdade(dynamic nascimento) { ... }

// Ruim — parâmetro que nunca é usado
void saudar(String nome, String sobrenome, int idade) {
  print('Olá, $nome'); // sobrenome e idade nunca usados
}
```

**4. Retorno ignorado sem motivo:**
```dart
String gerarCodigo() => 'ABC-123';

void main() {
  gerarCodigo(); // resultado jogado fora — pra que retornar?
}
```

**5. Efeitos colaterais ocultos:**
```dart
List<int> numeros = [1, 2, 3];

void dobrar(List<int> lista) {
  for (var i = 0; i < lista.length; i++) {
    lista[i] *= 2; // modifica a lista original sem avisar!
  }
}
```

**Minha observação:**

O exemplo dos efeitos colaterais ocultos é o mais perigoso na prática. Quando uma função recebe uma lista e a modifica internamente sem o chamador saber, isso pode causar bugs muito difíceis de rastrear. O ideal seria retornar uma nova lista, ou pelo menos deixar claro no nome que a função modifica o original — como `dobrarEmLugar` ou documentar com `///`. O exemplo de parâmetros não utilizados também é algo que acontece com frequência quando o código evolui e a função é modificada sem limpar a assinatura.

---

## 11. Como organizar minhas funções no código?

**Pergunta feita à IA:**
> Como organizar minhas funções no código?

**Resposta resumida da IA:**

- **Agrupar por responsabilidade:** Funções que tratam de usuários ficam juntas, funções de cálculo ficam juntas, etc.
- **Separar em arquivos:** Em projetos maiores, cada grupo de funções vai em um arquivo próprio (`usuario_utils.dart`, `calculo_utils.dart`).
- **Funções auxiliares perto de quem as usa:** Se uma função só existe para ajudar outra, declare-a próxima dela.
- **Ordem sugerida em um arquivo:**
  1. Funções públicas principais no topo
  2. Funções auxiliares privadas (prefixo `_`) abaixo
- **Usar classes para agrupar quando fizer sentido:** Se funções compartilham estado ou são muito relacionadas, uma classe pode ser mais adequada.

```dart
// funcoes_texto.dart
String capitalizar(String texto) => /* ... */;
String removerEspacos(String texto) => /* ... */;
bool eVazio(String texto) => texto.trim().isEmpty;

String _normalizarInterno(String texto) => /* ... */; // auxiliar privada
```

**Minha observação:**

Ainda estou no começo, então tudo fica em um arquivo só. Mas já entendo a lógica de separar por responsabilidade — é o mesmo princípio da responsabilidade única aplicado a arquivos inteiros. O prefixo `_` para funções privadas em Dart é elegante: a convenção de privacidade é por arquivo, não por classe, então `_minhaFuncao` só pode ser chamada dentro do mesmo arquivo `.dart`.

---

## Reflexões Finais

Funções são o coração de qualquer programa e o módulo deixou isso claro. Os principais aprendizados desta interação:

1. **Responsabilidade única** é o princípio mais importante — uma função, uma tarefa.
2. **Tipar sempre** os parâmetros e o retorno — `dynamic` é uma armadilha.
3. **Parâmetros nomeados** com `{}`, `required` e valores padrão tornam funções muito mais agradáveis de usar.
4. **`olaMundo` ≠ `olaMundo()`** — uma é referência, outra é execução — distinção fundamental para programação funcional.
5. **Funções são objetos** em Dart — podem ser guardadas, passadas e retornadas como qualquer outro valor.
6. **Efeitos colaterais ocultos** são o tipo de problema mais difícil de rastrear — evitar modificar dados externos sem deixar claro.

Como na atividade de coleções, o valor real veio de questionar as respostas e criar exemplos próprios adaptados ao meu contexto — não copiar diretamente o que a IA gerou.

---

*Atividade realizada como parte do curso Lince Tech Academy.*
