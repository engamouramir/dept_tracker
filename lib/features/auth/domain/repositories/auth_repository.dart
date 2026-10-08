import 'package:dartz/dartz.dart';
import 'package:expense_tracker/core/error/failure.dart';
import 'package:expense_tracker/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:expense_tracker/features/auth/domain/enteties/user_entity.dart';

class AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepository({required this.authRemoteDataSource});

  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String password,
  }) async {
    try {
      final res = await authRemoteDataSource.registerWithEmailAndPassword(
        email,
        password,
      );
      final userEntity = res.toEntity();
      return Right(userEntity);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await authRemoteDataSource.loginWithEmailAndPassword(
        email,
        password,
      );
      final userEntity = res.toEntity();
      return Right(userEntity);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> logout() async {
    try {
      await authRemoteDataSource.logout();
      return const Right(null);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    final user = authRemoteDataSource.getCurrentUser();
    if (user != null) {
      final userEntity = UserEntity(
        id: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? '',
      );
      return Right(userEntity);
    } else {
      return const Right(null);
    }
  }

  Future<Either<Failure, Stream<UserEntity?>>> authStateChanges() async {
    try {
      final stream = authRemoteDataSource.authStateChanges().map((user) {
        if (user != null) {
          return UserEntity(
            id: user.uid,
            email: user.email ?? '',
            name: user.displayName ?? '',
          );
        } else {
          return null;
        }
      });
      return Right(stream);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
  }
}
