import 'package:flutter/material.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';
import 'package:guideaut/widgets/middle_bar.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MiddleBar(),
            MenuTopBar(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sobre o GuideAut',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text(
                      ""
                      'O Guideaut é resultado de uma série de trabalhos '
                      'científicos desenvolvidos por alunos dos cursos de '
                      'computação da Universidade do Estado do Amazonas (UEA).'
                      '\nTodas as suas funcionalidades foram pensadas para atender '
                      'todo o processo do ProAut, que é um processo específico '
                      'para desenvolvimento de interfaces de aplicações voltadas '
                      'para o público autista. \nTal processo foi resultado, também, '
                      'de uma ampla pesquisa da Prof. Dr. Aurea Melo.'
                      "",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 64),
                    Text(
                      'Funcionalidades Atuais',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text(
                      ""
                      'Tutorial do ProAut'
                      '\n\nBusca por Recomendações'
                      '\n\nPainel Administrativo'
                      "",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Versão 1.0.0',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
