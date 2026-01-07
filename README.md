# API Service Wrapper

A Flutter wrapper around Dio HTTP client providing a unified API service interface with secure token management, functional error handling, and cross-platform support.

## Features

- 🚀 **Clean Architecture**: Well-structured wrapper around Dio HTTP client
- 🔐 **Secure Token Management**: Automatic token storage and refresh with encrypted persistence
- 🛡️ **Functional Error Handling**: Type-safe error handling using `Either` monad from fpdart
- 📱 **Cross-Platform**: Works on iOS, Android, macOS, Windows, Linux, and Web
- 🔄 **HTTP Methods Support**: Full support for GET, POST, PUT, DELETE, PATCH methods
- ⚙️ **Flexible Configuration**: Custom headers, query parameters, and request options
- 📊 **Progress Tracking**: Built-in upload/download progress callbacks
- 🔄 **Automatic Token Refresh**: Seamless token refresh with callback support

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  api_service_wrapper: ^1.0.0
```

## Quick Start

### Basic Setup

```dart
import 'package:api_service_wrapper/api_service_wrapper.dart';

void main() async {
  // Create Dio instance
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.example.com',
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  ));

  // Initialize API Service Wrapper (REQUIRED)
  final apiService = ASWImplementation(dio: dio);
  await apiService.initialize();
}
```

> **Important**: Always call `await apiService.initialize()` after creating the ASWImplementation instance to properly set up token management.

### Making Requests

```dart
// GET request
final result = await apiService.getMethod<String>('/users');
result.fold(
  (error) => print('Error: ${error.message}'),
  (response) => print('Success: ${response.data}'),
);

// POST request with body
final postResult = await apiService.postMethod<Map<String, dynamic>>(
  '/users',
  body: {'name': 'John Doe', 'email': 'john@example.com'},
);

// Custom headers and options
final customResult = await apiService.getMethod<String>(
  '/protected-endpoint',
  option: ASWOption(
    header: ASWHeader.basic(),
    query: {'page': '1', 'limit': '10'},
  ),
);
```

### Token Management

```dart
// Set authentication tokens
await apiService.setTokens(ASWTokenPair(
  accessToken: 'access-token-here',
  refreshToken: 'refresh-token-here',
));

// Check authentication status
final isAuthenticated = await apiService.isAuthenticated;

// Clear tokens
await apiService.clearTokens();
```

### Authentication Headers

When you set tokens using `setTokens()`, the `ASWTokenInterceptor` automatically adds the `Authorization: Bearer <access_token>` header to all requests. You don't need to manually add bearer headers - just set your tokens and the interceptor handles the rest.

For protected endpoints, simply make requests normally:

```dart
// This request will automatically include the Bearer token header
final result = await apiService.getMethod<String>('/protected-endpoint');
```

### Advanced Configuration

```dart
final apiService = ASWImplementation(
  dio: dio,
  tokenRefreshCallback: (refreshToken) async {
    // Implement your token refresh logic
    final response = await dio.post('/refresh', data: {'refreshToken': refreshToken});
    final data = response.data as Map<String, dynamic>;
    return right(ASWTokenPair(
      accessToken: data['accessToken'] as String,
      refreshToken: data['refreshToken'] as String?,
    ));
  },
  onTokenExpired: () {
    // Handle token expiration (e.g., navigate to login)
    print('Token expired!');
  },
  interceptors: [
    // Add custom interceptors
    LogInterceptor(),
  ],
);
```

## API Reference

### ASWImplementation

Main implementation class that provides HTTP methods:

- `getMethod<T>(endpoint, {option, cancelToken})`
- `postMethod<T>(endpoint, {option, body, cancelToken})`
- `putMethod<T>(endpoint, {option, body, cancelToken})`
- `deleteMethod<T>(endpoint, {option, body, cancelToken})`
- `patchMethod<T>(endpoint, {option, body, cancelToken})`

### ASWOption

Configuration class for request options:

```dart
ASWOption(
  header: ASWHeader.basic(),
  query: {'key': 'value'},
  onReceiveProgress: (current, total) => print('Progress: $current/$total'),
  responseType: ASWResponseType.json(),
)
```

### ASWTokenPair

Token container class:

```dart
ASWTokenPair(
  accessToken: 'access-token',
  refreshToken: 'refresh-token',
)
```

## Error Handling

All methods return `Either<DioException, Response<T>>` for functional error handling:

```dart
final result = await apiService.getMethod('/endpoint');

result.fold(
  (error) {
    // Handle DioException
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        // Handle timeout
        break;
      case DioExceptionType.badResponse:
        // Handle HTTP errors
        break;
      default:
        // Handle other errors
    }
  },
  (response) {
    // Handle successful response
    final data = response.data;
  },
);
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
