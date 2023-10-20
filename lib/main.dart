import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
const mycolor = Colors.black87;

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key: _scaffoldKey, // Asigna la clave al Scaffold
      appBar: AppBar(
        title: const Text('Alchemy OF Souls'),
        centerTitle:true,
        backgroundColor: Colors.black38,
        leading: IconButton(
          icon: const Icon(Icons.menu), // Icono del menú
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer(); // Abre el Drawer
          },
        ),
      ),
      backgroundColor: Colors.cyan,
      drawer: Drawer(
        backgroundColor: Colors.blueGrey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              
              accountName: Text("Luis Pichardo"),
              accountEmail: Text("20211928@itla.edu.do"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/Prueba1.gif'),
              ),
              decoration: BoxDecoration(
              color: Colors.cyan, 
              ),
            ),
            ListTile(
              title: const Text('En mi vida', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),),
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const MyExperienceVideo(videoAsset: '', title: 'En mi vida', description: '')));
              },
            ),
            ListTile(
              title: const Text('Acerca de', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white), ),
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const AboutAppScreen()));
                
              },
            ),
            ListTile(
              title: const Text('Creditos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),),
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const CreditsAppScreen()));
              },
            ),
            ListTile(
              title: const Text('Contratame', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),),
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const HireAppScreen()));
              },
            ),
          ],
        ),
      ),
      body: PageView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: const [
          MyCustomWidget(),
          CardOptions(),
        ],
      ),
  );}
}
// Pantalla Principal
class MyCustomWidget extends StatelessWidget {
  const MyCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Portada
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              "Alquimia de almas",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),

          // Carrusel de Portadas
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true, // Puedes cambiar a false si no deseas que se reproduzcan automáticamente
              enlargeCenterPage: true,
              height: 500, 
            ),
            items: const [
              PortadaItem('assets/Portada1.jpg'),
              PortadaItem('assets/Portada2.jpg'),
              PortadaItem('assets/Portada3.jpg'),
              PortadaItem('assets/Portada4.jpg'),
              PortadaItem('assets/Portada5.jpg'),
              PortadaItem('assets/Portada6.jpg'),
            ],
          ),
          
          Container(
          margin: const EdgeInsets.all(10),
          child: Center(
          child: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, size: 55),
          onPressed: () {
           PageView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: const [
          MyCustomWidget(),
          CardOptions(),
        ],
        );
        },
        ),
        ),
        )
        ],
      ),
    );
  }
}

// Carrusel de Portadas (aquí puedes agregar más portadas)

class PortadaItem extends StatelessWidget {
  final String imagePath;

  const PortadaItem(this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

//Pantalla de opciones estilo dashboard
class CardOptions extends StatelessWidget {
  const CardOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg_image2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: const Text(
                  'Selecciona una opción:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Card(
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          right: 10,
                          left: 35,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const CharacterListScreen()));
                          },
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.home, size: 80, color: Colors.blue),
                              Text('Personajes', style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          right: 35,
                          left: 10,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const MomentListScreen()));
                          },
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.work, size: 80, color: Colors.green),
                              Text('Momentos', style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Card(
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          right: 10,
                          left: 35,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const PlotAppScreen()));
                          },
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.school, size: 80, color: Colors.orange),
                              Text('Trama', style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          right: 35,
                          left: 10,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const CastAndCrewCard()));
                          },
                          // ignore: prefer_const_constructors
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: <Widget>[
                              const Icon(Icons.person, size: 80, color: Colors.purple),
                              const Text('Produccion y elenco', style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 350,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const Text(
                  'Datos curiosos',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,),
                ),
                const SizedBox(height: 20, width: 40),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 200,
                    enlargeCenterPage: true,
                  ),
                  items: [
                    SizedBox(
                      width: 400,
                      child: CardWidget(description: 'Se les ofreció los papeles principales a Lee Jong Suk y Song Hye Kyo. Pero no se pudo llegar a un acuerdo. Se había considerado a Park Hye Soo para el papel principal, pero la oferta fue retirada.', color: Colors.red),
                    ),
                    SizedBox(
                      width: 400,
                      child: CardWidget(description: 'La actriz Park Hye Eun fue seleccionada para el papel principal, pero después de la primera lectura de guion y de que comenzaran las grabaciones del drama la actriz decidió retirarse, el comunicado emitido por la producción del drama dice: "A pesar de ser una actriz novata, Park Hye Eun trabajó duro para prepararse para su papel; sin embargo, sintió una inmensa presión como protagonista femenina del drama.', color: Colors.green),
                    ),
                    SizedBox(
                      width: 400,
                      child: CardWidget(description: 'Como resultado a ser novata, el personal de producción mantuvo largas discusiones con Park Hye Eun y llegó a un acuerdo respetando las opiniones de ambas partes', color: Colors.blue),
                    ),
                    SizedBox(
                      width: 400,
                      child: CardWidget(description: 'El 13 y 14 de agosto de 2022 no se emitió ningún episodio.', color: Colors.orange)),
                    SizedBox(
                      width: 400,
                      child: CardWidget(description: 'El 26 de agosto, tvN confirmó que se encuentra en grabaciones la segunda parte del drama Alchemy of Souls, es el mismo reparto y las grabaciones concluirán en el otoño de 2022 y la emisión de la segunda parte iniciará en diciembre de 2022. El 20 de octubre se confirmó que la premier de la segunda temporada se estrenará el 10 de diciembre.', color: Colors.purple),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Pantallas para las cards de opciones
//Lista Personajes
//Lista de objetos de personajes
class Character {
  final String name;
  final String photo;
  final String description;

  Character({required this.name, required this.photo, required this.description});
}

final List<Character> characters = [
  Character(
    name: "Jang Uk",
    photo: "assets/Prueba1.gif",
    description: "Jang-uk y Nak-su ya había podido casarse con el Maestro Lee de testigo. Un año después, tenían como misión atrapar a las reliquias que habían escapado de Jinyowon. Esto gracias a las habilidades como hechicero de Jang-uk y a los poderes divinos que todavía conservaba el cuerpo de Jin Bu-yeon.",
  ),
  Character(
    name: "Mudeok",
    photo: "assets/Portada6.jpg",
    description: "Naksu es una poderosa hechicera y una asesina temida por todo el país, hasta que su única salvación es realizar la alquimia de almas, práctica prohibida, de tal modo que su alma queda encerrada dentro del cuerpo de la débil sirvienta Mudeok. Mudeok acaba trabajando para la noble familia Jang, donde conoce a Jang Uk. Ambos deciden colaborar para cumplir sus deseos: Jang Uk es un joven problemático que quiere conseguir destreza en sus habilidades y Mudeok quiere recuperar su antiguo cuerpo y agilidad.",
  ),
  Character(
    name: "Seo Yul",
    photo: "assets/SeoYul.jpg",
    description: "Seo Yul se convirtió en el líder de Jeongjingak, la academia que formaba a hechiceros en la primera temporada, pero que cerró después de que Jang-uk poseyera la Piedra de Hielo. El heredero de la familia Seo decidió reabrir el lugar y buscar a nuevos estudiantes, pero con métodos diferentes, pues no solo buscaban hechiceros, sino también personas con talento y buena energía, algo que podía identificar gracias a los poderes de Bu-yeon/Nak-su.",
  ),
  Character(
    name: "Park Jin y la sra. Kim",
    photo: "assets/Kim.jpg",
    description: "Park Jin y la sra. Kim sobrevivieron los ataques que recibieron en el episodio 9 de la segunda temporada. Finalmente, se casaron y se mudaron juntos. Además, se dio a entender que la sra. Kim estaba embarazada, pues había sentido náuseas.",
  ),
  Character(
    name: "Jin Mu",
    photo: "assets/jinMu.jpg",
    description: "Después de la primera temporada, fue muy decepcionante volver a ver a Jin Mu, quien no había recibido ningún castigo por sus acciones. Al contrario, seguía al lado de la casa real y se volvió Gwanju de Cheonbugwan. Sin embargo, la misma historia no se repitió dos veces. Al final de la serie, Jin Mu fue derrotado por Jang-uk, quien lo quemó vivo con el Ave de Fuego, junto con el resto de los codiciosos miembros de la Asamblea Unánime.",
  ),
  Character(
    name: "Jin Cho Yeon y Park Dang-gu",
    photo: "assets/Prueba1.gif",
    description: "Cho Yeon y Dang-gu también pudieron completar sus planes de boda luego de que estos fueran interrumpidos en la primera temporada. Un año después de derrotar a Jin Mu, la pareja estaba casada y había tenido a gemelos varones.",
  ),
];

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personajes'),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: mycolor,
      body: Center(
        child: ListView.builder(
          scrollDirection: Axis.vertical, 
          itemCount: characters.length,
          itemBuilder: (context, index) {
            final character = characters[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Margen personalizado
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CharacterDetailsScreen(character: character),
                    ),
                  );
                },
                child: Card(
                  elevation: 5, // Sombra de la tarjeta
                  child: Column(
                    children: [
                      Container(
                        width: 150, // Ancho de la imagen
                        height: 150, // Alto de la imagen
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2), // Sombra de la imagen
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            character.photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        character.name,
                        style: const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: mycolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Text(
                character.name,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(character.photo),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(20),
              child: Text(
                character.description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Define la clase Moment para representar los momentos favoritos de la serie
class Moment {
  final String name;
  final String videoAsset;
  final String description;

  Moment({required this.name, required this.videoAsset, required this.description});
}

// Lista de momentos favoritos de la serie
final List<Moment> moments = [
  Moment(
    name: "Momento 1",
    videoAsset: "assets/momento1.mp4",
    description: "Descripción del Momento 1...",
  ),
  Moment(
    name: "Momento 2",
    videoAsset: "assets/momento2.mp4",
    description: "Descripción del Momento 2...",
  ),
  Moment(
    name: "Momento 3",
    videoAsset: "assets/momento3.mp4",
    description: "Descripción del Momento 3...",
  ),
];

// Pantalla principal que muestra la lista de momentos
class MomentListScreen extends StatelessWidget {
  const MomentListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Momentos Favoritos de la Serie'),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: moments.length,
          itemBuilder: (context, index) {
            final moment = moments[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MomentDetailsScreen(moment: moment),
                    ),
                  );
                },
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: VideoPlayerWidget(videoAsset: moment.videoAsset),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        moment.name,
                        style: const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Widget reutilizable para mostrar videos
class VideoPlayerWidget extends StatefulWidget {
  final String videoAsset;

  const VideoPlayerWidget({Key? key, required this.videoAsset}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAsset)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

// Pantalla de detalles de momentos
class MomentDetailsScreen extends StatelessWidget {
  final Moment moment;

  const MomentDetailsScreen({Key? key, required this.moment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(moment.name),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Text(
                moment.name,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            VideoPlayerWidget(videoAsset: moment.videoAsset),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(20),
              child: Text(
                moment.description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Pantalla para la trama de la serie...
class PlotAppScreen extends StatelessWidget {
  const PlotAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trama'),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.cyan, 
      body: Center(
        child: Container(
          height: 550,
          margin: const EdgeInsets.all(16), 
          padding: const EdgeInsets.all(16), 
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(8), 
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5, // Sombra ligera
              ),
            ],
          ),
          child: const SingleChildScrollView( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Trama Temporada 1',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 16),
                Text(
                  'El drama cuenta la historia de 4 personas que cambian de almas, luego de enfrentarse a espíritus celestiales. En el país de Daeho, Jang Wook proviene de la noble familia Jang. Guarda un desagradable secreto sobre su nacimiento, del que habla la gente de todo el país. El es alborotador pero regresa al camino correcto en la vida después de conocer a Mu Deok Yi, ella es una guerrera de élite, pero su alma está atrapada en un cuerpo físicamente débil. Ella se convierte en la sirvienta de Jang Wook, pero también le enseña en secreto cómo pelear, aumentando la expectativa por su química como maestro y alumno. Seo Youl proviene de la noble familia Seo. Parece perfecto con buena apariencia, inteligencia y fuertes habilidades en artes marciales. Sin embargo, alberga sentimientos de amor puro hacia una chica secreta. Go Won es el príncipe heredero de Daeho. Espera convertirse en un rey generoso, pero después de que Mu Deok Yi ve a través de él su naturaleza humana y de mal genio, Go Won solo revela sus verdaderos sentimientos frente a Mu Deok Yi. ',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 16),
                Text(
                  'Trama Temporada 2',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 16),
                Text(
                  'En la segunda temporada, el cambio en la protagonista, de Mudeok a Bárbara, generó mucha controversia al principio. Sin embargo, ambas actrices hacen un trabajo excepcional al dar vida a personajes tan distintos y necesarios en diferentes momentos de la historia. La química entre ellas y los otros personajes es notable. La serie se destaca por su vestuario, impresionantes paisajes, cambios de apariencia, maquillaje, efectos especiales, banda sonora y un final memorable. Además, cuenta con un elenco de actores populares que han dejado huella en otros dramas. Si buscas una experiencia dramática y emocionante con un toque de romance, esta serie tiene mucho que ofrecer. ¡Prepárate para un viaje inolvidable!"',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class CardWidget extends StatelessWidget {
  final String description;
  final Color color;

  // ignore: prefer_const_constructors_in_immutables
  CardWidget({super.key, required this.description, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(description, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
// Pantalla para la lista de elenco y productores
class CastAndCrewCard extends StatelessWidget {
  const CastAndCrewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView( // Envuelve el CastAndCrewCard en un ListView
      children: const <Widget>[
        Card(
          elevation: 4,
          margin: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('Producción', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              ListTile(
                title: Text('Director: Park Joon Hwa'),
              ),
              ListTile(
            title: Text('Guionistas: Hong Jung Eun; Hong Mi Ran'),
          ),
          ListTile(
            title: Text('Reparto', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('Alchemy of Souls 2 - Cuadro de relaciones', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('Familia Seo', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('Hwang Min Hyun como Seo Youl'),
          ),
          ListTile(
            title: Text('Do Sang Woo como Seo Yoon Oh'),
          ),
          ListTile(
            title: Text('Personas cercanas a Jang Wook', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('Oh Na Ra como Kim Do Joo'),
          ),
          ListTile(
            title: Text('Jang Tae Min como Sirviente Lee'),
          ),
          ListTile(
            title: Text('Songrim' , style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('Yoo Joon Sang como Park Jin'),
          ),
          ListTile(
            title: Text('Yoo In Soo como Park Dang Goo'),
          ),
          ListTile(
            title: Text('Lee Ha Yool como Sang Ho'),
          ),
          ListTile(
            title: Text('Sejukwon', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('Lee Do Kyung como Heo Yeom'),
          ),
          ListTile(
            title: Text('Hong Seo Hui como Heo Yoon Ok'),
          ),
          ListTile(
            title: Text('Jung Ji Ahn como Soon Yi'),
          ),
          ListTile(
            title: Text('Kim Yong Jin como Médico Seo Eui Won'),
          ),
          ListTile(
            title: Text('Jinyowon', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('Park Eun Hye como Jin Ho Kyung'),
          ),
          ListTile(
            title: Text('Arin como Jin Cho Yeon'),
          ),
          ListTile(
            title: Text('Yoon Hae Vin como Jin Bu Yeon'),
          ),
          ListTile(
            title: Text('Familia Real', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('Shin Seung Ho como Go Won'),
          ),
          ListTile(
            title: Text('Choi Kwang Il como Go Soon'),
          ),
          ListTile(
            title: Text('Shim So Young como Seo Ha Sun'),
          ),
          ListTile(
            title: Text('Lee Ki Seob como Eunuco Oh'),
          ),
          ListTile(
            title: Text('Cheonbugwan', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('Jo Jae Yoon como Jin Moo'),
          ),
          ListTile(
            title: Text('Cha Yong Hak como Yeom Su'),
          ),
          ListTile(
            title: Text('Lee Ji Hoo como Cha Beom'),
          ),
          ListTile(
            title: Text('Lee Bong Joon como Gu Hyo'),
          ),
          ListTile(
            title: Text('Joo Min Soo como Han Yeol'),
          ),
          ListTile(
            title: Text('Chwiseonru', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('Park So Jin como Joo Wol'),
          ),
          ListTile(
            title: Text('Asamblea unánime'),
          ),
          ListTile(
            title: Text('Woo Hyun como Monk Ho Yeon'),
          ),
          ListTile(
            title: Text('Kim Sang Il'),
          ),
          ListTile(
            title: Text('Kim Jin Goo'),
          ),
          ListTile(
            title: Text('Lee Young Jin'),
          ),
          ListTile(
            title: Text('Jang Eui Don'),
          ),
          ListTile(
            title: Text('Otros', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('Im Chul Soo como Profesor Lee'),
          ),
          ListTile(
            title: Text('Seo Hye Won como So Yi'),
          ),
            ],
          ),
        ),
      ],
    );
  }
}


// Pantalla para la opcion "Acerca de..." de mi menu de opciones...
class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de "Alquimia de almas"'),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.cyan, 
      body: Center(
        child: Container(
          height: 550,
          margin: const EdgeInsets.all(16), 
          padding: const EdgeInsets.all(16), 
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(8), 
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5, 
              ),
            ],
          ),
          child: const SingleChildScrollView( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Título: Alquimia de almas',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 16),
                Text(
                  'Primera emisión',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 6),

                Text(
                  'Temporada 1: 18 de junio de 2022.',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 6),
                Text(
                  'Temporada 2: 10 de diciembre de 2022',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 6),
                Text(
                  'Última emisión:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 6),
                Text(
                  'Temporada 1: 28 de agosto de 2022.',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 6),
                Text(
                  'Temporada 2: 08 de enero de 2023',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 6),
                Text(
                  'Compositor',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 6),
                Text(
                  'Nam Hye-seung2',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 6),
                Text(
                  'Temporadas',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 6),
                Text(
                  '2 temporadas',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 6),
                Text(
                  'Sinopsis',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 6),
                Text(
                  'Es un drama histórico de fantasía sobre el amor y el crecimiento de unos jóvenes magos que lidian con la energía celestial y se sobreponen a sus torcidos destinos. El escenario es un mundo imaginario que se inspira en las historias de los refugiados de Goguryeo antes de que se fundara Balhae, pero no se basa en una historia real. Sigue la historia de una combatiente de élite llamada Nak-su, cuya alma queda atrapada accidentalmente dentro del cuerpo débil de Mu-deok, la sirviente del noble Jang Uk.',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  textAlign: TextAlign.justify, 
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Pantalla para la opcion "En mi vida..." de mi menu de opciones...
class MyExperienceVideo extends StatefulWidget {
  final String videoAsset;
  final String title;
  final String description;

  const MyExperienceVideo({super.key, 
    required this.videoAsset,
    required this.title,
    required this.description,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MyExperienceVideoState createState() => _MyExperienceVideoState();
}

class _MyExperienceVideoState extends State<MyExperienceVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAsset)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20),
              child: Text(
                widget.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                  child: Icon(
                    _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

// Pantalla para la opcion "Creditos..." de mi menu de opciones...
class CreditsAppScreen extends StatelessWidget {
  const CreditsAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de "Alquimia de almas"'),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.cyan, 
      body: Center(
        child: Container(
          height: 550,
          margin: const EdgeInsets.all(16), 
          padding: const EdgeInsets.all(16), 
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(8), 
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5, 
              ),
            ],
          ),
          child: const SingleChildScrollView( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Agradecimiento a los Creadores de "Alquimia de Almas".',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 16),
                Text(
                  'Queremos expresar nuestro sincero agradecimiento a los talentosos creadores de "Alquimia de Almas". Su dedicación y creatividad han dado vida a una serie que ha cautivado los corazones de innumerables seguidores en todo el mundo. A través de su narrativa envolvente, personajes memorables y una trama fascinante, han brindado a los amantes del cine una experiencia inolvidable. ',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 16),
                Text(
                  'Agradecimiento a Luis Pichardo, Desarrollador de Software.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 16),
                Text(
                  'Queremos rendir homenaje y dar las gracias a Luis Pichardo, un hábil desarrollador de software que ha hecho posible que los apasionados fans de "Alquimia de Almas" disfruten aún más de su amor por la serie. Su dedicación y esfuerzo al crear una aplicación relacionada con esta serie han ampliado nuestras posibilidades de explorar y disfrutar del universo de "Alquimia de Almas" de maneras innovadoras. Agradecemos a Luis por su valiosa contribución a la comunidad de fans y por hacer que nuestra experiencia con "Alquimia de Almas" sea aún más especial. Su creatividad y habilidades técnicas merecen nuestro reconocimiento y gratitud sincera.',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 16),
                Text(
                  'Desarrollado por Luis Pichardo. Desde República Dominicana. ',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                Text(
                  'S.P.M 17-10-2023',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Pantalla para la opcion "Contratame..." de mi menu de opciones...
class HireAppScreen extends StatelessWidget {
  const HireAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de "Alquimia de almas"'),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.cyan, 
      body: Center(
        child: Container(
          height: 550,
          width: 350,
          margin: const EdgeInsets.all(16), 
          padding: const EdgeInsets.all(16), 
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(8), 
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5, 
              ),
            ],
          ),
          child: const SingleChildScrollView( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
              backgroundImage: AssetImage('assets/Prueba1.gif'), 
              radius: 80, 
            ),
            SizedBox(height: 20), 
            Text(
              'Luis Pichardo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, 
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Teléfono:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, 
              ),
            ),
            SizedBox(height: 20),
            Text(
              '+1 809-878-0828',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
              'Correo:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, 
              ),
            ),
            SizedBox(height: 20),
            Text(
              '20211928@itla.edu.do',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'YouTube:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, 
              ),
            ),
            SizedBox(height: 20),
            Text(
              '@code-geek',
              style: TextStyle(fontSize: 18,),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}