import 'package:agrotech/features/5.products/domain/models/product_response_model.dart';

import '../../data/network/product_repository_impl.dart';

abstract class GetProductUseCase {
  Future<List<ProductResponseModel>?> getListProducts(
      {required String userEmail});
}

class GetProductUseCaseImpl extends GetProductUseCase {
  final ProductRepository productRepository;

  GetProductUseCaseImpl(
    this.productRepository,
  );

  @override
  Future<List<ProductResponseModel>?> getListProducts(
      {required String userEmail}) async {
    try {
      var productData = await productRepository.getProductsByEmail(userEmail);
      List<ProductResponseModel>? listProducts = [];

      for (var entry in productData['products']) {
        listProducts.add(ProductResponseModel.fromJson(entry));
      }
      return listProducts;
    } catch (e) {
      throw ('Error al obtener la lista de productos: $e');
    }
  }

  Future<Map<String, dynamic>> updateProduct(
      ProductResponseModel? updatedProducts) async {
    try {
      final productData = updatedProducts!.toJson(); //toJsonEdit
      var r = await productRepository.updateProductsDataRep(productData);
      return r;
    } catch (e) {
      throw ('Error al actualizar la lista de productos: $e');
    }
  }

  Future<String> deleteProduct(int? idProduct) async {
    try {
      var d = await productRepository.deleteProductsById(idProduct);
      return d;
    } catch (e) {
      throw ('Error al borrar el producto: $e');
    }
  }

  Future<Map<String, dynamic>> saveProduct(
      ProductResponseModel? savedProductos) async {
    try {
      final productData = savedProductos!.toJson();
      var s = await productRepository.saveProductDataRep(productData);
      return s;
    } catch (e) {
      throw ('Error al guardar el producto: $e');
    }
  }
}
