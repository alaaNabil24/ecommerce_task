# a simple e-commerce


## Features

- Product list screen with the ability to add products to the shopping cart.
- Cart List


## App structure.

This project follows **Clean Architecture** principles. The app is structured into several layers:

- **Core**: Contains theme, constants, di , and helpers.
- **Features**: Each feature is encapsulated in its own directory, containing:
  - **Data**: Models, repositories, and data sources.
  - **Domain**: Entities, use cases, and repository interfaces.
  - **Presentation**: UI components including pages, widgets, and state management.
 
  - 
## Packages Used

This project utilizes several packages to enhance functionality and streamline development. Below is an explanation of each package and the rationale for its inclusion:

- **cupertino_icons: ^1.0.6**
  - Provides a set of iOS-style icons. Chosen for its ability to enhance the UI with native iOS aesthetics, making the app feel more integrated on Apple devices.

- **dio: ^5.7.0**
  - A powerful HTTP client for Dart, which supports FormData, file uploading, and request cancellation. Selected for its rich feature set, including interceptors, global configuration, and easy error handling.

- **get_it: ^8.0.0**
  - A service locator for dependency injection. Chosen for its simplicity and efficiency in managing dependencies throughout the app, allowing for better testability and separation of concerns.

- **flutter_bloc: ^8.1.6**
  - Implements the BLoC (Business Logic Component) pattern, enabling state management in a reactive way. This package was chosen for its robust structure that helps maintain clean architecture and makes it easier to manage the app's state.

- **flutter_svg: ^2.0.10+1**
  - A package for rendering SVG images in Flutter. Selected for its ability to display scalable graphics, which is useful for responsive designs without losing image quality.

- **cached_network_image: ^3.4.1**
  - Provides an easy way to cache images from the network. Chosen to improve performance and user experience by reducing loading times and data usage for frequently accessed images.

- **hive_flutter: ^1.1.0**
  - A lightweight and fast NoSQL database for Flutter, along with Flutter-specific extensions. Chosen for its ease of use and performance, especially for local data storage.

- **internet_connection_checker_plus: ^2.5.2**
  - A simple way to check internet connectivity status. Selected to provide real-time feedback on connectivity, enhancing the user experience by managing offline scenarios.

- **hive: ^2.2.3**
  - The core package for Hive, providing the essential features for local data storage. It was chosen for its high performance and minimal overhead, suitable for handling structured data.

- **fluttertoast: ^8.2.8**
  - A package for displaying toast messages. Chosen for its simplicity in providing non-intrusive feedback to users, enhancing user interaction with notifications.

- **dartz: ^0.10.1**
  - A functional programming library for Dart. Selected to leverage functional programming concepts, which can simplify error handling and improve code readability and maintainability.

- **pretty_dio_logger: ^1.4.0**
  - A logger for Dio, providing pretty-printing of request and response data. Chosen for its utility in debugging API calls, making it easier to visualize and troubleshoot network interactions.



## Steps to Run the Project

Follow these steps to get the Flutter project up and running on your local machine:

### 1. Prerequisites

- Ensure you have [Flutter SDK](https://flutter.dev/docs/get-started/install) installed.
- Make sure you have a compatible IDE such as [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/) with the Flutter and Dart plugins.

### 2. Clone the Repository

Open your terminal and clone the repository using the following command:

```bash
git clone https://github.com/alaaNabil24/market_app_task.git
```

### 3. Navigate to the project directory:
```bash
cd market_app_task
```
### 4. Install the dependencies:
```bash
flutter pub get
```

### 5. Running the App:
```bash
flutter run
```

