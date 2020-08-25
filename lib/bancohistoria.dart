import 'package:quirkpath/pergunta.dart';

class BancoHistoria {
  int _perguntaN = 0;
  bool fim = false;

  List<Pergunta> _perguntas = [
    Pergunta(
        pergunta:
            'Estás na rua a dar um passeio e ouves pedidos de socorro, o que fazes?',
        resposta1: 'Corres e procuras pela pessoa que pede socorro.',
        resposta2: 'Ignoras e continuas o teu passeio.'),
    Pergunta(
        pergunta:
            'De longe, vês que um vilão está a tentar roubar a mala de uma civil.',
        resposta1:
            'Aproximo-me sem que reparem em mim, enquanto penso numa forma de salvar a civil.',
        resposta2: 'Vou ao encontro do vilão e tento afastá-lo.'),
    Pergunta(
        pergunta:
            'Ainda não tens controlo sobre a tua quirk, mas mesmo assim vais ao socorro da civil?',
        resposta1: 'Olho em volta e procuro ajuda.',
        resposta2:
            'Claro, sou um Herói e os heróis salvam quem está em perigo'),
    Pergunta(
        pergunta: 'Ao procurar ajuda vês o All Might, o que fazes?',
        resposta1: 'Peço-lhe ajuda e informo-o da situação.',
        resposta2:
            'Aceno com os braços até que ele repare em mim e peço ajuda.'),
    Pergunta(
        pergunta:
            'O All Might precisa de uma distração para que possa salvar a civil ilesa, ajudas?',
        resposta1: 'Sim, pergunto o que posso fazer para ajudar.',
        resposta2: 'Não, ele é o All Might, só vou atrapalhar.'),
    Pergunta(
        pergunta:
            'A civil é salva, falas com All Might e ele percebe que serás o melhor sucessor para o One For All.',
        resposta1:
            'Não podes aceitar porque acreditas que a tua quirk irá ser melhor.',
        resposta2: 'Aceitas ser o sucessor.'),
  ];

  void perguntaSeguinte(int nResposta) {
    if (_perguntaN < _perguntas.length - 1) {
      _perguntaN++;
      if (nResposta != 1) {
        reset();
      }
    } else if (_perguntaN == _perguntas.length - 1) {
      fim = true;
    }
  }

  bool getBoolAcabou() {
    return fim;
  }

  String getPergunta() {
    return _perguntas[_perguntaN].pergunta;
  }

  String getResposta1() {
    return _perguntas[_perguntaN].resposta1;
  }

  String getResposta2() {
    return _perguntas[_perguntaN].resposta2;
  }

  void reset() {
    _perguntaN = 0;
    fim = false;
  }
}
