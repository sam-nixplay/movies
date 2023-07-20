# Movies App (Flutter)

A Flutter project that fetches movies from [TheMovieDB](https://www.themoviedb.org/) using Flutter BLoC for state management, Retrofit as a REST client, and Freezed for code generation. The app also employs `go_router` for navigation and uses Patrol and Mocktail for testing.

## Table of Contents
1. [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
2. [Usage](#usage)
3. [Testing](#testing)
4. [Dependencies](#dependencies)
5. [Contributing](#contributing)
6. [License](#license)
7. [Acknowledgments](#acknowledgments)

## Getting Started

### Prerequisites

- **Flutter 3.10.5**: This project uses Flutter version 3.10.5. We recommend managing Flutter versions with FVM for a smoother development experience.

### Installation

1. **Install FVM (Flutter Version Management)**

    FVM helps manage multiple Flutter SDK versions and allows for pinning a version per project.

    First, ensure you have Dart installed on your machine. If not, follow the [official Dart installation guide](https://dart.dev/get-dart).

    With Dart installed, you can install FVM:
    ```bash
    dart pub global activate fvm
    ```

    Ensure that the path `~/.pub-cache/bin` is in your system's PATH so that you can run `fvm` from any terminal window.

2. **Clone the repository**
   ```bash
   git clone https://github.com/sam-nixplay/movies.git
   cd movies
   ```

3. **Install Flutter using FVM**
   ```bash
   fvm install 3.10.5
   ```

4. **Switch to the Flutter version for this project (if you have multiple Flutter versions)**
   ```bash
   fvm global 3.10.5
   ```

5. **Get dependencies**
   ```bash
   flutter pub get
   ```

6. **Setting up API Token**

   The app expects an API token from [TheMovieDB](https://www.themoviedb.org/) to be available in an `.env` file located at the root of the project. Create or modify the `.env` file and add your API token as follows:
   ```plaintext
   API_TOKEN=YOUR_THEMOVIEDB_API_TOKEN
   ```

## Usage

1. **Run the app**
   ```bash
   flutter run
   ```

## Testing

1. **Run tests**
   ```bash
   flutter test
   ```

## Dependencies

- **flutter_bloc**: State management.
- **retrofit**: REST client.
- **freezed**: Code generation for immutability.
- **go_router**: Navigation and routing.
- **patrol**: Testing utility.
- **mocktail**: Mocking utility for testing.

## Contributing

If you want to contribute to this project, please fork the repository, create your feature branch, commit your changes, and open a PR against the main branch.

## License

This project is under the MIT License. See [LICENSE.md](LICENSE.md) for more details.

## Acknowledgments

- Thanks to [TheMovieDB](https://www.themoviedb.org/) for providing the movie data API.

---

Remember to replace placeholders like `your-repo-link` with appropriate values before pushing this README or sharing with others. Also, ensure the `.env` file is added to your `.gitignore` to avoid accidentally pushing your API token.