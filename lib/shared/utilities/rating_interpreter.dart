class RatingInterpreter{
  static String getRating(String oldRating){
    switch(oldRating){
      case 'G - All Ages':
        return 'L';
      case 'PG - Children':
        return '10';
      case 'PG-13 - Teens 13 or older':
        return '+13';
      case 'R - 17+ (violence & profanity)':
      case 'R+ - Mild Nudity':
        return '+17';
      case 'Rx - Hentai':
        return '+18';
      default:
        return 'L';
    }
  }
}