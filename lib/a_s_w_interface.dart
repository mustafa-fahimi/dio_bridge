import 'package:dio_bridge/dio_bridge.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

abstract class ASWInterface {
  Future<void> initialize();

  Future<Either<DioException, Response<T>>> getMethod<T>(
    String endpoint, {
    ASWOption? option,
    CancelToken? cancelToken,
  });

  Future<Either<DioException, Response<T>>> putMethod<T>(
    String endpoint, {
    ASWOption? option,
    dynamic body,
    CancelToken? cancelToken,
  });

  Future<Either<DioException, Response<T>>> deleteMethod<T>(
    String endpoint, {
    ASWOption? option,
    dynamic body,
    CancelToken? cancelToken,
  });

  Future<Either<DioException, Response<T>>> postMethod<T>(
    String endpoint, {
    ASWOption? option,
    dynamic body,
    CancelToken? cancelToken,
  });

  Future<Either<DioException, Response<T>>> patchMethod<T>(
    String endpoint, {
    ASWOption? option,
    dynamic body,
    CancelToken? cancelToken,
  });

  Future<void> setTokens(ASWTokenPair tokenPair);

  Future<void> clearTokens();

  Future<ASWTokenPair?> get currentTokens;

  Future<bool> get isAuthenticated;

  Future<bool> get isTokenExpired;
}
