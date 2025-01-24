# Movie Search App

## Overview
This is a movie search application built using **Swift** and **UIKit**. The app allows users to search for movies from a database and view a list of results with relevant details.

## Features
- **Search Movies:**
  - Search for movies by title using a user-friendly search bar.
  - Display a list of matching movies with key details such as title, release year, and poster.
- **Responsive UI:**
  - Optimized for various screen sizes using UIKit components like `UITableView`, `UIImageView`, and `UILabel`.
- **Networking:**
  - Fetch movie data dynamically from a movie database API using URLSession.


### Key Components
1. **Search View Controller:**
   - Contains a search bar (`UISearchBar`) for user input.
   - Displays search results in a `UITableView`.

2. **Movie Detail View Controller:**
   - Shows detailed information about a selected movie.
   - Includes UI elements such as `UIImageView` for the movie poster and `UILabel` for text details.

3. **Networking Layer:**
   - Uses `URLSession` to fetch movie data from an external API.
   - Handles JSON parsing to map API responses to Swift models.

4. **Models:**
   - Represents movie data with structures such as `Movie` and `MovieDetails`.

### Flow
1. User enters a query in the search bar.
2. App fetches matching movie data from the API.
3. Results are displayed in a table view.
