import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dpad_container/dpad_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimeCatalogScreen(),
    );
  }
}

class AnimeCatalogScreen extends StatefulWidget {
  const AnimeCatalogScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimeCatalogScreenState createState() => _AnimeCatalogScreenState();
}

class _AnimeCatalogScreenState extends State<AnimeCatalogScreen> {
  int? selectedIndex;
  int? onFocusIndex;

  final List<String> _images = [
      'assets/images/banner1.jpg',
      'assets/images/banner2.jpg',
      'assets/images/banner3.jpg',
      'assets/images/banner4.jpg',
      'assets/images/banner5.jpg',
      'assets/images/banner6.jpg',

    // Lista de imágenes de animes
  ];

  final List<Map<String, dynamic>> animeList = [
     {
      'name': 'Nombre Anime 1',
      'image': 'assets/images/anime1.png',
      'genre': 'Acción',
    },
    {
      'name': 'Nombre Anime 2',
      'image': 'assets/images/anime2.png',
      'genre': 'Aventura',
    },
    {
      'name': 'Nombre Anime 3',
      'image': 'assets/images/anime3.png',
      'genre': 'Comedia',
    },
    {
      'name': 'Nombre Anime 4',
      'image': 'assets/images/anime4.png',
      'genre': 'Aventura',
    },
    {
      'name': 'Nombre Anime 5',
      'image': 'assets/images/anime5.png',
      'genre': 'Acción',
    },
    {
      'name': 'Nombre Anime 6',
      'image': 'assets/images/anime6.png',
      'genre': 'Romance',
    },
    {
      'name': 'Nombre Anime 7',
      'image': 'assets/images/anime7.png',
      'genre': 'Mecha',
    },
    {
      'name': 'Nombre Anime 8',
      'image': 'assets/images/anime8.png',
      'genre': 'Drama',
    },
    {
      'name': 'Nombre Anime 9',
      'image': 'assets/images/anime9.png',
      'genre': 'Acción',
    },
    {
      'name': 'Nombre Anime 10',
      'image': 'assets/images/anime10.png',
      'genre': 'Comedia',
    },
        {
      'name': 'Nombre Anime 11',
      'image': 'assets/images/anime11.png',
      'genre': 'Acción',
    },
        {
      'name': 'Nombre Anime 12',
      'image': 'assets/images/anime12.png',
      'genre': 'Aventura',
    },
        {
      'name': 'Nombre Anime 13',
      'image': 'assets/images/anime13.png',
      'genre': 'Drama',
    },
        {
      'name': 'Nombre Anime 14',
      'image': 'assets/images/anime14.png',
      'genre': 'Aventura',
    },
    {
      'name': 'Nombre Anime 15',
      'image': 'assets/images/anime15.png',
      'genre': 'Mecha',
    },
    {
      'name': 'Nombre Anime 16',
      'image': 'assets/images/anime16.png',
      'genre': 'Acción',
    },
    {
      'name': 'Nombre Anime 17',
      'image': 'assets/images/anime17.png',
      'genre': 'Aventura',
    },
    {
      'name': 'Nombre Anime 18',
      'image': 'assets/images/anime18.png',
      'genre': 'Comedia',
    },
    {
      'name': 'Nombre Anime 19',
      'image': 'assets/images/anime19.png',
      'genre': 'Comedia',
    },
    {
      'name': 'Nombre Anime 20',
      'image': 'assets/images/anime20.png',
      'genre': 'Acción',
    },
        {
      'name': 'Nombre Anime 21',
      'image': 'assets/images/anime21.png',
      'genre': 'Mecha',
    },
        {
      'name': 'Nombre Anime 22',
      'image': 'assets/images/anime22.png',
      'genre': 'Mecha',
    },
        {
      'name': 'Nombre Anime 23',
      'image': 'assets/images/anime23.png',
      'genre': 'Mecha',
    },
        {
      'name': 'Nombre Anime 24',
      'image': 'assets/images/anime24.png',
      'genre': 'Drama',
    },
        {
      'name': 'Nombre Anime 25',
      'image': 'assets/images/anime25.png',
      'genre': 'Drama',
    },
        {
      'name': 'Nombre Anime 26',
      'image': 'assets/images/anime26.png',
      'genre': 'Drama',
    },
        {
      'name': 'Nombre Anime 27',
      'image': 'assets/images/anime27.png',
      'genre': 'Drama',
    },
        {
      'name': 'Nombre Anime 28',
      'image': 'assets/images/anime28.png',
      'genre': 'Romance',
    },
        {
      'name': 'Nombre Anime 29',
      'image': 'assets/images/anime29.png',
      'genre': 'Romance',
    },
        {
      'name': 'Nombre Anime 30',
      'image': 'assets/images/anime30.png',
      'genre': 'Romance',
    },
        {
      'name': 'Nombre Anime 31',
      'image': 'assets/images/anime31.png',
      'genre': 'Romance',
    },
    // Aqui le podemos meter mas animes (se vienen los de otoñoooo)
  ];

  List<dynamic> getGenres() {
  // Obtener lista de géneros únicos de animeList
  return animeList.map((anime) => anime['genre']).toSet().toList();
  } 

  List<dynamic> getAnimeImagesByGenre(String genre) {
    // Filtrar las imágenes por género
    return animeList
        .where((anime) => anime['genre'] == genre)
        .map((anime) => anime['image'])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アニメHUB', style: TextStyle(fontWeight: FontWeight.bold),),
        
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: CarouselSlider(
              items: _images.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return AspectRatio(
                      aspectRatio: 4 / 1,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 4 / 1,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: getGenres().length,
              itemBuilder: (ctx, i) {
                final genre = getGenres()[i];
                final genreImages = getAnimeImagesByGenre(genre);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        genre,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: genreImages.length,
                        itemBuilder: (ctx, i) {
                          final image = genreImages[i];
                          return DpadContainer(
                            onClick: () => setState(() => selectedIndex = i),
                            onFocus: (bool isFocused) => setState(() => onFocusIndex = isFocused ? i : null),
                            child: ImageCard(
                              image: image,
                              focus: onFocusIndex == i,
                              selected: selectedIndex == i,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final bool selected;
  final bool focus;
  final String image;

  const ImageCard({
    Key? key,
    required this.selected,
    required this.image,
    required this.focus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 300, // Tamaño de las imágenes MAS GRANDESSSS
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: focus ? Colors.white : Colors.black,
          border: Border.all(
            color: focus ? Colors.white : (selected ? Colors.blue.shade400 : Colors.black),
            width: 5,
          ),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
