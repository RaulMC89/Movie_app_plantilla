import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';


/*llamamos a ppintar lo que queramos y le añadimos la consulta importando el 
provider que es donde esta la consulta
*/
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    //print(moviesProvider.onDispleyMovies);
    //print(moviesProvider.onPopular);
//aqui tenemos el appbar con los diferentes listas de peliculas
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Cartellera'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Targetes principals
              CardSwiper(movies: moviesProvider.onDispleyMovies),
              // Slider de pel·licules
              MovieSlider(movies: moviesProvider.onPopular),
              // Poodeu fer la prova d'afegir-ne uns quants, veureu com cada llista és independent
              TopRated(movies: moviesProvider.onTopRateMovies),

              // MovieSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
