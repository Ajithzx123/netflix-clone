const apiKey = 'f1485af0ebc928dab80a9898e8c038d2';

const tmdb = 'https://api.themoviedb.org/3';
const query = '&language=en-US&query=a&page=1&include_adult=false';
const query2 =
    '&language=en-US&sort_by=popularity.desc&page=1&timezone=America%2FNew_York&include_null_first_air_dates=false&with_watch_monetization_types=flatrate&with_status=0&with_type=0';
const withoutQuery = '&language=en-US&page=1';
const adultFalse = '$withoutQuery/&query=a&include_adult=false';
