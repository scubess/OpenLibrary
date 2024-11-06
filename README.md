# Book Search App - Clean Architecture Example
This project demonstrates how to implement Clean Architecture using Swift and MVVM pattern for a simple book search application. It features:

- A search bar to search for books
- A table view to display book search results
- A detail view to display selected book information
- Error handling with mock data for unit tests

### Features:
* Search Books: The app uses a simple search bar to query books.
* Books Repository: Fetches data using a repository and returns results to the view model.
* ViewModel: Uses the MVVM pattern to handle the data and prepare it for display.
* Clean Architecture: The app follows clean architecture principles by separating concerns into distinct layers: Presentation, Domain, Data, and Testing.

### Run the Application
#### Launch the App

* Select a simulator or device and press Cmd + R to run the app.
* Search for Books:
* In the main view, type a search query (e.g., "The lord of the rings") in the search bar. The app will display a list of books based on your query.
* View Book Details:
* Tap on a book in the list to view its details.

### Unit Tests

This project includes unit tests for the SearchViewModel and BooksRepository. The tests are designed to verify that the application logic works correctly, including successful and failed searches.

#### To run the tests,
Open the project in Xcode.
Go to the Test Navigator and select SearchViewModelTests.swift or BooksRepositoryTests.swift.
Press Cmd + U to run the tests.