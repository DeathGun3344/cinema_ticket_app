import 'package:cinema_ticket_app/models/Movie.dart';
import 'package:cinema_ticket_app/pages/SeatPage.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class HomePage extends StatelessWidget {

  static const routeName = '/';

  final double marginG = 20;
  final double heightM = 300;

  final List<Movie> movies = [
    Movie(title: 'Moonlight Movie', star: 3, image: 'https://m.media-amazon.com/images/M/MV5BNzQxNTIyODAxMV5BMl5BanBnXkFtZTgwNzQyMDA3OTE@._V1_.jpg'),
    Movie(title: 'Mission impossible', star: 2, image: 'https://upload.wikimedia.org/wikipedia/en/f/ff/MI_%E2%80%93_Fallout.jpg')
  ];

  final List<Movie> trendings = [
    Movie(title: 'The Mountain Between Us', star: 3, image: 'https://upload.wikimedia.org/wikipedia/en/1/17/TheMountainBetweenUsfilmposter.jpg', genres: ['Action', 'Drame']),
    Movie(title: 'Alita Battle Angel', star: 3, image: 'https://upload.wikimedia.org/wikipedia/en/thumb/e/ee/Alita_Battle_Angel_%282019_poster%29.png/220px-Alita_Battle_Angel_%282019_poster%29.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: marginG),
                height: 100,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Movies', style: Theme.of(context).textTheme.headline1,),
                    IconButton(icon: Icon(Icons.search), onPressed: ()=> null)
                  ],
                ),
              ),
              Container(
                height: heightM,
                child: ListView.builder(
                  itemCount: movies.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, i) {
                    Movie movie = movies[i];
                      return InkWell(
                        onTap: () => Navigator.pushNamed(context, SeatPage.routeName),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: marginG),
                          height: heightM,
                          width: 170,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 6,
                                  child: formatImage(movie.image)
                              ),
                              Expanded(
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                      child: Text(movie.title, style: Theme.of(context).textTheme.bodyText1,))
                              ),
                              Expanded(
                                  child: SmoothStarRating(
                                      allowHalfRating: false,
                                      starCount: 5,
                                      rating: movie.star.toDouble(),
                                      size: 15.0,
                                      isReadOnly:true,
                                      color: Color(0xFFFFAB2E),
                                      borderColor: Color(0xFFFFAB2E),
                                  )
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: marginG),
                height: 50,
                alignment: Alignment.centerLeft,
                child: Text('Trending', style: Theme.of(context).textTheme.headline1,),
              ),
              ...trendings.map(
                      (movie) => InkWell(
                        onTap: () => Navigator.pushNamed(context, SeatPage.routeName),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: marginG),
                          height: 150,
                          child: Row(
                            children: [
                              Expanded(
                                  child: formatImage(movie.image)
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(movie.title, style: Theme.of(context).textTheme.bodyText1,),
                                      SizedBox(height: 10,),
                                      SmoothStarRating(
                                        allowHalfRating: false,
                                        starCount: 5,
                                        rating: movie.star.toDouble(),
                                        size: 15.0,
                                        isReadOnly:true,
                                        color: Color(0xFFFFAB2E),
                                        borderColor: Color(0xFFFFAB2E),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(movie.genresLitteral(), style: Theme.of(context).textTheme.bodyText2,),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
                      )
              ).toList()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.local_movies_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
        ],
      ),
    );
  }

  Widget formatImage(String image) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover
          )
      ),
    );
  }

}
