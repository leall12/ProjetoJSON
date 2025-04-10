// ignore_for_file: unnecessary_this

class Filmes {
  late String nome;
  late String classificacao;
  late DateTime lancamento;
  late double duracao;
  late String generos;
  late String diretor;
  late String escritor;
  late String atores;
  late String sinopse;
  late String linguagens;
  late String pais;
  late String premios;
  late String metascore;
  late String imdbVotes;
  late String imdbId;
  late String tipo;

  filmes() {
    nome = "";
    classificacao = "";
    lancamento = DateTime.now();
    duracao = 0;
    generos = "";
    diretor = "";
    escritor = "";
    atores = "";
    sinopse = "";
    linguagens = "";
    pais = "";
    premios = "";
    metascore = "";
    imdbVotes = "";
    imdbId = "";
    tipo = "";
  }

  Filmes.v(
    this.nome,
    this.classificacao,
    this.lancamento,
    this.duracao,
    this.generos,
    this.diretor,
    this.escritor,
    this.atores,
    this.sinopse,
    this.linguagens,
    this.pais,
    this.premios,
    this.metascore,
    this.imdbVotes,
    this.imdbId,
    this.tipo,
  );

  Filmes.fromJson(Map<String, dynamic> json)
    : nome = json['Title'] as String,
      classificacao = json['Rated'] as String,
      lancamento = json['Released'] as DateTime,
      duracao = json['Runtime'] as double,
      generos = json['Genre'] as String,
      diretor = json['Director'] as String,
      escritor = json['Writer'] as String;

  Map<String, dynamic> toJson() => {
    'Title': nome,
    'Rated': classificacao,
    'Released': lancamento,
    'Runtime': duracao,
    'Genre': generos,
    'Director': diretor,
    'Writer': escritor,
  };

  String dataLancFormatada() {
    //separa a data em um vetor
    final dt = lancamento.toString().split(' ');
    //pega apenas a parte da data e descosidera a hora e separa em um novo vetor
    //escreve o vetor de trás pra frente( dd/mm/aaaa) e junta novamente
    final d = dt[0].split('-').reversed.join('/');

    return d;
  }

  static DateTime tratarData(String dt) {
    final d = dt.toString().split('-');
    if (d.length == 1) {
      return DateTime(int.parse(d[0]));
    }
    if (d.length > 1) {
      final ano = d[0].isEmpty ? 2000 : d[0];
      final mes = d[1].isEmpty ? 01 : d[1];
      final dia = d[2].isEmpty ? 01 : d[2];
      return DateTime(
        int.parse(ano.toString()),
        int.parse(mes.toString()),
        int.parse(dia.toString()),
      );
    }
    return DateTime.now();
  }

  String tempo() {
    return duracao.toString();
  }
}
