// Titulo: App JokenPo.
// Autor: Rodrigo Almeida.
// Data: 01/11/2021.
import 'dart:math';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imageApp = AssetImage("assets/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";
  int _pontuacaoUsuario = 0;
  int _pontuacaoApp = 0;

  void _opcaoSelecionada(String escolhaDoUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numeros = Random().nextInt(3);
    var escolhaApp = opcoes[numeros];
    //Exibição da imagem escolhida pelo App
    switch (escolhaApp) {
      case 'pedra':
        setState(() {
          this._imageApp = AssetImage("assets/pedra.png");
        });
        break;
      case 'papel':
        setState(() {
          this._imageApp = AssetImage("assets/papel.png");
        });
        break;
      case 'tesoura':
        setState(() {
          this._imageApp = AssetImage("assets/tesoura.png");
        });
        break;
    }

    //Jogador Ganhador
    if ((escolhaDoUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaDoUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaDoUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Parabéns!!! Você é o ganhador :)";
        this._pontuacaoUsuario++;
      });
      //App Ganhador
    } else if ((escolhaApp == "pedra" && escolhaDoUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaDoUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaDoUsuario == "pedra")) {
      setState(() {
        this._mensagem = "Que pena! Você perdeu :(";
        this._pontuacaoApp++;
      });
    } else {
      this._mensagem = "EMPATE! ;)";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App: ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(
            image: this._imageApp,
            height: 150,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 32, top: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                  "assets/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                  "assets/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "assets/tesoura.png",
                  height: 100,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, top: 40),
                child: Text(
                  "Sua pontuação: " + _pontuacaoUsuario.toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Text(
                  "Pontuação App: " + _pontuacaoApp.toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
