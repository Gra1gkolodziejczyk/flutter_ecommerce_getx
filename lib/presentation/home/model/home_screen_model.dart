import '../../../data/models/products/product_response_model.dart';

class CategoriesWithProductModel {
  CategoriesWithProductModel({this.id, this.name, this.products});

  String? id;
  String? name;
  List<ProductResponseModel>? products;
}
