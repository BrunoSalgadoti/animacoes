import 'package:flutter/material.dart';

class MaisSobreAnimacoes extends StatefulWidget {
  const MaisSobreAnimacoes({Key? key}) : super(key: key);

  @override
  State<MaisSobreAnimacoes> createState() => _MaisSobreAnimacoesState();
}

class _MaisSobreAnimacoesState extends State<MaisSobreAnimacoes>
    with SingleTickerProviderStateMixin{

  AnimationController? _animationController;
  Animation? _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: const Duration(seconds:  2),
        vsync: this
    );
//------------------------------------------------------------------------------
    _animation = Tween<Offset>(
        begin: Offset(0,0),
        end: Offset(60,60) // primaira posição esquerda / topo
    ).animate( _animationController! );
//------------------------------------------------------------------------------
    /* // animações com valores de inicio e fim
    _animation = Tween<double>(
        begin: 0,
        end: 1
    ).animate( _animationController! );
     */
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _animationController!.forward();

    return SizedBox(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,

        child: AnimatedBuilder(
          animation: _animation!,
//------------------------------------------------------------------------------
          //widget para efeito de movimentação
          child: Stack(
            children: [
              Positioned(
                width: 180,
                height: 180,
                left: 0,
                top: 0,
                child: Image.asset("imagens/logo.png"),
              )
            ]),
//------------------------------------------------------------------------------
          //child: Image.asset("imagens/logo.png"), //widget para os demais efeitos

          builder: (context, widget){

//------------------------------------------------------------------------------
            // efeito de movimentação
            return Transform.translate(
              offset: _animation!.value, //OBS: neste caso na estrutura do value tem que mudar os valores
              child: widget,
            );
//------------------------------------------------------------------------------

            /* //efeito de aproximação
            return Transform.scale(
              scale: _animation!.value,
              child: widget,
            );
             */

            /* //efeito de rotação
            return Transform.rotate(
              angle: _animation!.value,
              child: widget,
            );
             */

          },
        ),

      ),
    );
  }
}
