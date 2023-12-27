
Description

The semester project for Mobile Programming course that offers the user the opportunity to watch the trailers, where the popular categories are displayed on the main screen, the details of the desired movie can be found among more than 800,000 movies via a free API with the help of Autocomplete technology. On the main screen, the movie of the week is listed first, followed by the popular categories. This is the section that attracts the most attention of users. On the search page, the user is given the opportunity to access almost any movie he wants, with an API that contains more than 800,000 movies. The crucial point of our application for undecided users is the 'I feel lucky' page. When you click the button on this page, a random movie will be suggested to you and you will not waste time wondering which movie to watch. Finally, the profile page contains personal information and favorite movies. From here, you can easily control the movies you want to watch and have an insatiable experience with a beautiful interface.

![alt text](https://github.com/arshmed/movie_recommender/assets/114264601/e33bfad4-2739-47ea-ba62-30196334bce1)

## API Kullanımı

#### Returns specified category movies

```http
  GET https://api.themoviedb.org/3/movie/popular?api_key=$apiKey
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `category` | `string` | category name |
| `api_key` | `string` | API key. |

#### Returns specified movie

```http
  GET https://api.themoviedb.org/3/search/movie?api_key=4b93d35d5c2089b7716defdd6d32c769&query=interstellar&page=1&include_adult=false
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `seaarch` | `string` | search |
| `query` | `string` | movie name |
| `api_key`      | `string` | API key. |


#### Returns category list

```http
  GET https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `list` | `string` | list |
| `api_key`      | `string` | API key. |


#### Returns Trailer of specified movie

```http
  GET https://api.themoviedb.org/3/movie/${movie_id.toString()}/videos?api_key=$apiKey
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id` | `string` | movie id |
| `api_key`      | `string` | API key. |![icon]


  
## Features

- 800.000+ movies
- Opportunity to watch trailer
- Full-screen mode
- Cross-Platform (IOS/Andriod)
- Personalize movies

## Screenshots
<img width="425" alt="Ekran Resmi 2022-12-23 18 48 42" src="https://github.com/arshmed/movie_recommender/assets/114264601/236d741d-4a64-4be8-92ed-2e677a11db17"><img width="437" alt="Ekran Resmi 2022-12-23 18 49 40" src="https://github.com/arshmed/movie_recommender/assets/114264601/6a6e3ac4-b28b-4751-8d58-61de50d3897a">
<img width="388" alt="Ekran Resmi 2022-12-23 19 07 01" src="https://github.com/arshmed/movie_recommender/assets/114264601/7ff161da-a5be-4f70-bd90-ffe1ee60c74e">
<img width="466" alt="Ekran Resmi 2022-12-24 23 03 15" src="https://github.com/arshmed/movie_recommender/assets/114264601/c05fdca5-067a-49cd-b656-4f13c0c6a7e3">
<img width="455" alt="Ekran Resmi 2022-12-24 23 07 41" src="https://github.com/arshmed/movie_recommender/assets/114264601/e2efdf11-3726-41ab-a44d-134f7ad0dc7a">
<img width="436" alt="Ekran Resmi 2022-12-23 18 50 01" src="https://github.com/arshmed/movie_recommender/assets/114264601/109f7e78-48fc-424e-97f9-85239ae450a6">

