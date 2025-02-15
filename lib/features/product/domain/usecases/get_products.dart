import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/utils/usecase.dart';
import 'package:e_commerce/features/product/domain/entities/product.dart';
import 'package:e_commerce/features/product/domain/repositories/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetProducts implements UseCase<List<Product>, NoParams> {
  final ProductRepository productRepository;
  GetProducts(this.productRepository);

  @override
  Future<Either<Failure, List<Product>>> invoke(NoParams params) {
    return productRepository.getAllProducts();
  }

}