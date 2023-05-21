# Weather App API Calling Folder

This folder contains the necessary code for making API calls in a weather app using Flutter. The code utilizes the `http` package to make HTTP requests and retrieve data from weatherapi.com. It also includes functionality for obtaining user location using the `geolocator` and `location` packages.

## Prerequisites

Before running the code in this folder, ensure you have the following:

- Flutter SDK: Make sure you have Flutter SDK installed on your machine. You can download it from the official Flutter website: [flutter.dev](https://flutter.dev).
- API Keys: Obtain API keys from the following services:
  - weatherapi.com: Visit [weatherapi.com](https://www.weatherapi.com) to sign up and obtain an API key.
  - Geolocator: The Geolocator package requires no API key.

## Getting Started

To get started with the weather app API calling code, follow these steps:

1. Clone the repository or download the source code files to your local machine.
2. Open the project in your preferred IDE or text editor.
3. Make sure all dependencies are resolved by running the following command in the terminal:

   ```bash
   flutter pub get
   ```

4. Open the `lib` folder and navigate to the folder containing the weather app API calling code.

   ```
   lib/
   └── weather_app_api_calling/
       ├── user_model.dart
       ├── api_service.dart
       ├── future_api_service.dart
       ├── constants.dart
       └── main.dart (not provided)
   ```

5. Copy the required code snippets from the provided files and integrate them into your main Flutter project.

## Code Explanation

Here's a brief explanation of the important files and functions within the weather app API calling folder:

- `user_model.dart`: Defines the user model for the weather app.
- `api_service.dart`: Provides an API service class responsible for making API calls to weatherapi.com.
- `future_api_service.dart`: Contains an API service class for making API calls to retrieve weather forecasts.
- `constants.dart`: Defines constants used in the API calls.

Make sure to replace the placeholders with the actual API keys obtained from the respective services.

## Usage

To make API calls and retrieve weather data in your Flutter app, you can utilize the functions available in the provided API service classes:

- `ApiService`: Provides functions to fetch weather data based on user queries and location.
- `FutureApiService`: Includes functions to retrieve weather forecasts based on user queries and location.

You can refer to the code snippets provided in the files to understand how to use these functions in your application.

## Troubleshooting

If you encounter any issues while running the code or making API calls, consider the following troubleshooting steps:

- Ensure that you have a stable internet connection.
- Double-check the API keys used in the code to ensure they are valid and correctly entered.
- Verify that the necessary dependencies are correctly installed by running `flutter pub get`.

If the issue persists, you can refer to the official documentation of the packages used (`http`, `geolocator`, and `location`) for more information and support.

## License

This weather app API calling code is released under the [MIT License](LICENSE). Feel free to modify and use it in your own projects.

## Acknowledgements

This code utilizes the following packages:

- `http`: [https://pub.dev/packages/http](https://pub.dev/packages/http)
- `geolocator`: [https://pub.dev/packages/geolocator](https://pub.dev/packages/geolocator