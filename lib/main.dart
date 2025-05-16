import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage()
    )
);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int totalPage = 4;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(initialPage: 0)..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[makePage( 
                page: 1,
                image: NetworkImage(
                'https://raw.githubusercontent.com/Leysi-Mejia-1078/imagenes/refs/heads/main/anillo.jpg'),
                title: 'Anillo de Zafiro',
                description: 'Este delicado anillo presenta un zafiro azul de corte cuadrado como piedra central, engastado con precisión en un engaste de cuatro puntas.',
              ), 
              makePage(
                page: 2,
                image: NetworkImage(
                'https://raw.githubusercontent.com/Leysi-Mejia-1078/imagenes/refs/heads/main/aretes.jpg'),
                title: 'Aros Dorados de Estilo Chunky',
                description: 'Estos llamativos aros dorados presentan un diseño chunky con acabado altamente pulido, ideal para añadir un toque de sofisticación y modernidad a cualquier look.',
              ), 
              makePage(
                page: 3,
                image: NetworkImage(
                'https://raw.githubusercontent.com/Leysi-Mejia-1078/imagenes/refs/heads/main/collar.jpg'),
                title: 'Colgante Elegancia',
                description: 'Este refinado collar presenta un colgante en forma de gota con una deslumbrante piedra verde, evocando la belleza de una esmeralda.',
              ),
              makePage(
                page: 4,
                image: NetworkImage(
                'https://raw.githubusercontent.com/Leysi-Mejia-1078/imagenes/refs/heads/main/pulsera.jpg'),
                title: 'Brazalete de Lujo Dorado',
                description: 'Este elegante brazalete dorado de la marca Sahira combina un diseño moderno con detalles clásicos.',
              )],
      ),
    );
  }

  Widget makePage({image, title, description, page}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(.5),
              Colors.black.withOpacity(.1),
            ]
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(page.toString(), style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
                  Text('/' + totalPage.toString(), style: TextStyle(color: Colors.black, fontSize: 15),)
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(title, style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.star, color: const Color.fromARGB(255, 60, 59, 59), size: 15,),
                        ),
                        Text('4.0 ', style: TextStyle(color: Colors.black),),
                        Text('(2300)', style: TextStyle(color: Colors.black, fontSize: 12),)
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:20),
                      child: Text(description, style: TextStyle(color: Colors.black, height: 1.9, fontSize: 15),),
                    ),
                    SizedBox(height: 0,),
                    Text('READ MODE', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black),)
                  ],
                ))
            ],
          ),
        ),
      ), 
    );
  }
}
