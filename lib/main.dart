import 'package:animacoes/AnimacaoImplicita.dart';
import 'package:animacoes/AnimacaoTween.dart';
import 'package:animacoes/AnimacoesExplicitasConstruidas.dart';
import 'package:animacoes/CriandoAnimacoesBasicas.dart';
import 'package:animacoes/MaisSobreAnimacoes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( const MaterialApp(

    title: "Animações",

    //home: animacaoImplicita(),
    //home: CriandoAnimacoesBasicas(),
    //home: AnimacaoTween(),
    //home: AnimacoesExplicitasConstruidas(),
    home: MaisSobreAnimacoes(),

    debugShowCheckedModeBanner: false,

  ));

}