
import 'package:meta/meta.dart';

class Movie {

  final String image;
  final String title;
  final int star;
  List<String> genres = [];

  Movie({@required this.title, @required this.star, @required this.image, List<String> genres}) {
    if(genres == null) {
      this.genres = [];
    } else  {
      this.genres = genres;
    }
  }
  
  String genresLitteral() {
    if(genres.length == 0) return '';
    String l = genres.join(', ');
    return l.substring(0, l.length - 1);
  }

}