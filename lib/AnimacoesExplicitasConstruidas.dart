import 'package:flutter/material.dart';

class AnimacoesExplicitasConstruidas extends StatefulWidget {
  const AnimacoesExplicitasConstruidas({Key? key}) : super(key: key);

  @override
  State<AnimacoesExplicitasConstruidas> createState() => _AnimacoesExplicitasConstruidasState();
}

class _AnimacoesExplicitasConstruidasState extends State<AnimacoesExplicitasConstruidas>
    with SingleTickerProviderStateMixin {

  AnimationController? _animationController;
  AnimationStatus? _animationStatus;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(seconds: 5),
        vsync: this
    )..repeat()..addStatusListener((status) {
      _animationStatus = status;
    });
    //..repeat() //"anotação em cascata" ---->inicia já em movimento;
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: Column( children: [

        SizedBox(
          width: 300,
          height: 400,
          child: RotationTransition(
            alignment: Alignment.center,
            child: Image.asset("imagens/logo.png"),
            turns: _animationController!,
          ),
        ),

        ElevatedButton(
            onPressed: (){
              setState(() {

                //Controla o status da animação
                if( _animationStatus == AnimationStatus.dismissed ){
                  _animationController!.forward();
                  _animationController!.repeat(); // para frente continua repetindo
                }else{
                  _animationController!.reverse();//necessita que a animação...
                  //estejá em ação, inicia-lá no initistate com o método em cascata...
                  //..repeat()
                }

                /* // au pressionar o botão a animação para ou recomeça
                if( _animationController.isAnimating ){
                  _animationController.stop();
                }else{
                  _animationController.repeat();
                }
                 */
              });
            },
            child: const Text( "Movimentar",
              style: TextStyle(
                fontSize: 20,
              color: Colors.black),),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shadowColor: Colors.black,
                elevation: 15,
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ))
        ),

          const Padding(padding: EdgeInsets.only(top: 20)),

           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                ElevatedButton(
                onPressed: (){
        setState(() {

          if( _animationStatus == AnimationStatus.dismissed || _animationStatus == AnimationStatus.forward){
            _animationController!.reverse();
          }
        });
        },
            child: const Icon(Icons.settings_backup_restore,
            size: 30,
            color: Colors.black,),
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shadowColor: Colors.black,
                elevation: 15,
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ))
        ),

        ElevatedButton(
            onPressed: (){
              setState(() {

                //Controla o status da animação
                if( _animationStatus == AnimationStatus.dismissed || _animationStatus == AnimationStatus.reverse){
                    _animationController!.forward();
                }
              });
            },
            child: const Icon(Icons.forward_5_outlined,
              size: 30,
              color: Colors.black,),
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shadowColor: Colors.black,
                elevation: 15,
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ))
        )

          ],)

        ],),
    );

  }
}
