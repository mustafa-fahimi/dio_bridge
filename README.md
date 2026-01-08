# dio_bridge

[![pub package](https://img.shields.io/pub/v/dio_bridge.svg)](https://pub.dev/packages/dio_bridge)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A Flutter wrapper around Dio HTTP client providing unified API service interface with secure token management, functional error handling, and cross-platform support.

---

## Table of Contents

- [dio\_bridge](#dio_bridge)
  - [Table of Contents](#table-of-contents)
  - [Features](#features)
  - [Installation](#installation)
  - [Quick Start](#quick-start)
  - [Usage](#usage)
    - [HTTP Methods](#http-methods)
    - [Request Configuration](#request-configuration)
    - [Token Management](#token-management)
    - [Automatic Token Refresh](#automatic-token-refresh)
    - [Error Handling](#error-handling)
    - [Request Cancellation](#request-cancellation)
  - [API Reference](#api-reference)
    - [Classes](#classes)
      - [`DioBridgeService`](#diobridgeservice)
      - [`DioBridgeOption`](#diobridgeoption)
      - [`DioBridgeHeader`](#diobridgeheader)
      - [`DioBridgeResponseType`](#diobridgeresponsetype)
      - [`DioBridgeTokenPair`](#diobridgetokenpair)
    - [Extensions](#extensions)
      - [`DioBridgeOptionEx` on `DioBridgeOption`](#diobridgeoptionex-on-diobridgeoption)
      - [`DioBridgeHeaderEx` on `DioBridgeHeader`](#diobridgeheaderex-on-diobridgeheader)
      - [`DioBridgeResponseTypeEx` on `DioBridgeResponseType`](#diobridgeresponsetypeex-on-diobridgeresponsetype)
    - [Typedefs](#typedefs)
      - [`OnPercentage`](#onpercentage)
  - [Complete Examples](#complete-examples)
    - [Complete API Service Setup](#complete-api-service-setup)
  - [License](#license)

---

## Features

- ✅ **HTTP Methods**: Full support for GET, POST, PUT, DELETE, PATCH with type-safe responses
- ✅ **Token Management**: Secure encrypted storage on native platforms, localStorage on web, automatic Bearer header injection, and token refresh
- ✅ **Error Handling**: Functional error handling using Either monad from fpdart
- ✅ **Progress Tracking**: Built-in upload/download progress callbacks
- ✅ **Flexible Configuration**: Custom headers, query parameters, response types, and interceptors
- ✅ **Automatic Token Refresh**: Seamless 401 handling with retry logic
- ✅ **Cross-Platform**: Works on iOS, Android, macOS, Windows, Linux, and Web

---

## Installation

```yaml
dependencies:
  dio_bridge: ^1.0.0
```

```bash
flutter pub get
```

---

## Quick Start

```dart
import 'package:dio_bridge/dio_bridge.dart';

void main() async {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.example.com',
  ));

  final apiService = DioBridgeService(dio: dio);
  await apiService.initialize();

  // Make a simple GET request
  final result = await apiService.getMethod<String>('/users');
  result.fold(
    (error) => print('Error: ${error.message}'),
    (response) => print('Success: ${response.data}'),
  );
}
```

---

## Usage

### HTTP Methods

All HTTP methods return `Either<DioException, Response<T>>` for functional error handling:

```dart
// GET request
final result = await apiService.getMethod<String>('/users');

// POST with body
final createResult = await apiService.postMethod<Map<String, dynamic>>(
  '/users',
  body: {'name': 'John', 'email': 'john@example.com'},
);

// PUT request
await apiService.putMethod('/users/1', body: {'name': 'Jane'});

// DELETE request
await apiService.deleteMethod('/users/1');

// PATCH request
await apiService.patchMethod('/users/1', body: {'active': false});
```

### Request Configuration

Use `DioBridgeOption` for custom headers, query parameters, and progress tracking:

```dart
final result = await apiService.getMethod<String>(
  '/search',
  option: DioBridgeOption(
    header: DioBridgeHeader.basic(headers: {'Custom-Header': 'value'}),
    query: {'q': 'flutter', 'limit': '10'},
    onReceiveProgress: (current, total) => print('Progress: ${(current/total*100).round()}%'),
    responseType: DioBridgeResponseType.json(),
  ),
);
```

### Token Management

```dart
// Set tokens (securely stored on native platforms, localStorage on web)
await apiService.setTokens(DioBridgeTokenPair(
  accessToken: 'your-access-token',
  refreshToken: 'your-refresh-token',
  expiresAt: DateTime.now().add(Duration(hours: 1)),
));

// Check authentication status
final isAuth = await apiService.isAuthenticated;
final isExpired = await apiService.isTokenExpired;

// Get current tokens
final tokens = await apiService.currentTokens;

// Clear tokens
await apiService.clearTokens();
```

> **Note**: On web platforms, tokens are stored using `localStorage` and are not cryptographically secure. On native platforms (iOS, Android, desktop), tokens are stored securely using encrypted storage.

### Automatic Token Refresh

Configure automatic token refresh for 401 responses:

```dart
final apiService = DioBridgeService(
  dio: dio,
  tokenRefreshCallback: (refreshToken) async {
    final response = await dio.post('/auth/refresh',
      data: {'refreshToken': refreshToken});

    return right(DioBridgeTokenPair(
      accessToken: response.data['accessToken'],
      refreshToken: response.data['refreshToken'],
    ));
  },
  onTokenExpired: () {
    // Navigate to login screen
    print('Token expired - redirecting to login');
  },
);
```

### Error Handling

All methods return `Either<DioException, Response<T>>`. Handle errors functionally:

```dart
final result = await apiService.postMethod('/api/data', body: data);

result.fold(
  (error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        showError('Connection timeout');
        break;
      case DioExceptionType.badResponse:
        showError('Server error: ${error.response?.statusCode}');
        break;
      default:
        showError('Network error: ${error.message}');
    }
  },
  (response) {
    // Handle success
    final responseData = response.data;
  },
);
```

### Request Cancellation

Cancel requests using `CancelToken`:

```dart
final cancelToken = CancelToken();
final result = await apiService.getMethod('/slow-endpoint', cancelToken: cancelToken);

// Cancel the request
cancelToken.cancel('Request cancelled by user');
```

---

## API Reference

### Classes

#### `DioBridgeService`

Abstract factory class providing the main API service interface with HTTP methods and token management.

**Constructors**

```dart
DioBridgeService({
  required Dio dio,
  List<Interceptor>? interceptors,
  Future<Either<String, DioBridgeTokenPair>> Function(String refreshToken)?
    tokenRefreshCallback,
  VoidCallback? onTokenExpired,
})
```

**Methods**

| Method                                                                                                | Returns                                     | Description                               |
| ----------------------------------------------------------------------------------------------------- | ------------------------------------------- | ----------------------------------------- |
| `initialize()`                                                                                        | `Future<void>`                              | Initializes the service and token manager |
| `getMethod<T>(String endpoint, {DioBridgeOption? option, CancelToken? cancelToken})`                  | `Future<Either<DioException, Response<T>>>` | Performs GET request                      |
| `postMethod<T>(String endpoint, {DioBridgeOption? option, dynamic body, CancelToken? cancelToken})`   | `Future<Either<DioException, Response<T>>>` | Performs POST request                     |
| `putMethod<T>(String endpoint, {DioBridgeOption? option, dynamic body, CancelToken? cancelToken})`    | `Future<Either<DioException, Response<T>>>` | Performs PUT request                      |
| `deleteMethod<T>(String endpoint, {DioBridgeOption? option, dynamic body, CancelToken? cancelToken})` | `Future<Either<DioException, Response<T>>>` | Performs DELETE request                   |
| `patchMethod<T>(String endpoint, {DioBridgeOption? option, dynamic body, CancelToken? cancelToken})`  | `Future<Either<DioException, Response<T>>>` | Performs PATCH request                    |
| `setTokens(DioBridgeTokenPair tokenPair)`                                                             | `Future<void>`                              | Stores authentication tokens securely     |
| `clearTokens()`                                                                                       | `Future<void>`                              | Removes stored authentication tokens      |
| `currentTokens`                                                                                       | `Future<DioBridgeTokenPair?>`               | Returns currently stored tokens           |
| `isAuthenticated`                                                                                     | `Future<bool>`                              | Checks if user is authenticated           |
| `isTokenExpired`                                                                                      | `Future<bool>`                              | Checks if current token is expired        |

#### `DioBridgeOption`

Configuration class for customizing HTTP requests with headers, query parameters, and progress callbacks.

**Constructors**

```dart
const DioBridgeOption({
  this.query,
  this.onReceiveProgress,
  this.onSendProgress,
  this.header = const DioBridgeHeader.basic(),
  this.responseType = const DioBridgeResponseType.json(),
})
```

**Properties**

| Property            | Type                    | Description                   |
| ------------------- | ----------------------- | ----------------------------- |
| `header`            | `DioBridgeHeader`       | Request headers configuration |
| `query`             | `Map<String, dynamic>?` | Query parameters              |
| `onReceiveProgress` | `OnPercentage?`         | Download progress callback    |
| `onSendProgress`    | `OnPercentage?`         | Upload progress callback      |
| `responseType`      | `DioBridgeResponseType` | Response type configuration   |

#### `DioBridgeHeader`

Sealed class providing predefined header configurations for different content types.

**Constructors**

```dart
const DioBridgeHeader.basic({Map<String, String>? headers})
const DioBridgeHeader.formData({Map<String, String>? headers})
const DioBridgeHeader.data({Map<String, String>? headers})
```

#### `DioBridgeResponseType`

Sealed class defining available response types for HTTP requests.

**Constructors**

```dart
const DioBridgeResponseType.json()
const DioBridgeResponseType.stream()
const DioBridgeResponseType.plain()
const DioBridgeResponseType.bytes()
```

#### `DioBridgeTokenPair`

Immutable class representing authentication token pair with optional expiration.

**Constructors**

```dart
const DioBridgeTokenPair({
  required String accessToken,
  String? refreshToken,
  DateTime? expiresAt,
})
```

**Properties**

| Property       | Type        | Description                     |
| -------------- | ----------- | ------------------------------- |
| `accessToken`  | `String`    | Access token for authentication |
| `refreshToken` | `String?`   | Refresh token for token renewal |
| `expiresAt`    | `DateTime?` | Token expiration timestamp      |
| `isExpired`    | `bool`      | Whether the token is expired    |

---

### Extensions

#### `DioBridgeOptionEx` on `DioBridgeOption`

Extension providing conversion to Dio Options.

| Method/Getter    | Returns   | Description                    |
| ---------------- | --------- | ------------------------------ |
| `requestOptions` | `Options` | Converts to Dio Options object |

**Example:**

```dart
final option = DioBridgeOption(
  header: DioBridgeHeader.basic(),
  responseType: DioBridgeResponseType.json(),
);

final dioOptions = option.requestOptions; // Options object
```

#### `DioBridgeHeaderEx` on `DioBridgeHeader`

Extension providing header map conversion.

| Method/Getter | Returns               | Description                                          |
| ------------- | --------------------- | ---------------------------------------------------- |
| `toMap`       | `Map<String, String>` | Converts to header map with appropriate content-type |

**Example:**

```dart
final header = DioBridgeHeader.basic(headers: {'Custom': 'value'});
final headerMap = header.toMap;
// {'accept': 'application/json', 'content-type': 'application/json; charset=utf-8', 'Custom': 'value'}
```

#### `DioBridgeResponseTypeEx` on `DioBridgeResponseType`

Extension providing conversion to Dio ResponseType.

| Method/Getter | Returns        | Description                       |
| ------------- | -------------- | --------------------------------- |
| `toDio`       | `ResponseType` | Converts to Dio ResponseType enum |

**Example:**

```dart
final responseType = DioBridgeResponseType.json();
final dioResponseType = responseType.toDio; // ResponseType.json
```

---

### Typedefs

#### `OnPercentage`

```dart
typedef OnPercentage = void Function(int currentBytes, int totalBytes);
```

Callback function for tracking upload/download progress with current and total bytes.

---

## Complete Examples

### Complete API Service Setup

Complete example showing full service setup with token management, custom interceptors, and error handling:

```dart
import 'package:dio_bridge/dio_bridge.dart';
import 'package:dio/dio.dart';

class ApiService {
  late final DioBridgeService _service;

  Future<void> initialize() async {
    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.example.com',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));

    _service = DioBridgeService(
      dio: dio,
      interceptors: [
        LogInterceptor(requestBody: true, responseBody: true),
      ],
      tokenRefreshCallback: _refreshToken,
      onTokenExpired: _handleTokenExpired,
    );

    await _service.initialize();
  }

  Future<Either<String, DioBridgeTokenPair>> _refreshToken(String refreshToken) async {
    try {
      final response = await Dio().post(
        'https://api.example.com/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      return right(DioBridgeTokenPair(
        accessToken: response.data['accessToken'],
        refreshToken: response.data['refreshToken'],
        expiresAt: DateTime.now().add(Duration(hours: 1)),
      ));
    } catch (e) {
      return left('Token refresh failed');
    }
  }

  void _handleTokenExpired() {
    // Navigate to login screen
    print('Token expired - redirecting to login');
  }

  // Authentication methods
  Future<Either<DioException, Response<Map<String, dynamic>>>> login(
    String email,
    String password,
  ) async {
    final result = await _service.postMethod<Map<String, dynamic>>(
      '/auth/login',
      body: {'email': email, 'password': password},
    );

    // Store tokens on successful login
    result.fold(
      (error) => null,
      (response) async {
        final tokenData = response.data;
        if (tokenData != null) {
          await _service.setTokens(DioBridgeTokenPair(
            accessToken: tokenData['accessToken'],
            refreshToken: tokenData['refreshToken'],
            expiresAt: DateTime.now().add(Duration(hours: 1)),
          ));
        }
      },
    );

    return result;
  }

  // Data methods with automatic token handling
  Future<Either<DioException, Response<List<dynamic>>>> getUsers() {
    return _service.getMethod<List<dynamic>>('/users');
  }

  Future<Either<DioException, Response<Map<String, dynamic>>>> createUser(
    Map<String, dynamic> userData,
  ) {
    return _service.postMethod<Map<String, dynamic>>(
      '/users',
      body: userData,
    );
  }

  Future<Either<DioException, Response<Map<String, dynamic>>>> uploadFile(
    String filePath,
    void Function(int current, int total) onProgress,
  ) {
    return _service.postMethod<Map<String, dynamic>>(
      '/upload',
      option: DioBridgeOption(
        header: DioBridgeHeader.formData(),
        onSendProgress: onProgress,
      ),
      body: FormData.fromMap({
        'file': MultipartFile.fromFileSync(filePath),
      }),
    );
  }

  Future<void> logout() async {
    await _service.clearTokens();
  }
}
```

---

## License

```
MIT License

Copyright (c) 2026 Mustafa Fahimi
```

---

<p align="center">
Made with ❤️ by <a href="https://github.com/mustafa-fahimi">Mustafa Fahimi</a>
</p>
