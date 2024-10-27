class ProductResponse {
  final bool success;
  final String? message;
  final List<ProductSubCategory> data;

  ProductResponse({
    required this.success,
    this.message,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      success: json['success'],
      message: json['message'],
      data: List<ProductSubCategory>.from(
        json['data'].map((item) => ProductSubCategory.fromJson(item)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': List<dynamic>.from(data.map((item) => item.toJson())),
    };
  }
}

class ProductSubCategory {
  final int productSubCategoryID;
  final String subCategoryName;
  final String subCategoryCode;
  final List<Material> materials;

  ProductSubCategory({
    required this.productSubCategoryID,
    required this.subCategoryName,
    required this.subCategoryCode,
    required this.materials,
  });

  factory ProductSubCategory.fromJson(Map<String, dynamic> json) {
    return ProductSubCategory(
      productSubCategoryID: json['productSubCategoryID'],
      subCategoryName: json['subCategoryName'],
      subCategoryCode: json['subCategoryCode'],
      materials: List<Material>.from(
        json['materials'].map((item) => Material.fromJson(item)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productSubCategoryID': productSubCategoryID,
      'subCategoryName': subCategoryName,
      'subCategoryCode': subCategoryCode,
      'materials': List<dynamic>.from(materials.map((item) => item.toJson())),
    };
  }
}

class Material {
  final int materialInfoID;
  final String fullName;
  final String code;
  final int productSubCategoryID;
  final int smallestUnitID;
  final String smallestUnitName;
  final int status;
  final double publicPurchasePrice;
  final String thumbnail;

  Material({
    required this.materialInfoID,
    required this.fullName,
    required this.code,
    required this.productSubCategoryID,
    required this.smallestUnitID,
    required this.smallestUnitName,
    required this.status,
    required this.publicPurchasePrice,
    required this.thumbnail,
  });

  factory Material.fromJson(Map<String, dynamic> json) {
    return Material(
      materialInfoID: json['materialInfoID'],
      fullName: json['fullName'],
      code: json['code'],
      productSubCategoryID: json['productSubCategoryID'],
      smallestUnitID: json['smallestUnitID'],
      smallestUnitName: json['smallestUnitName'],
      status: json['status'],
      publicPurchasePrice: json['publicPurchasePrice'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'materialInfoID': materialInfoID,
      'fullName': fullName,
      'code': code,
      'productSubCategoryID': productSubCategoryID,
      'smallestUnitID': smallestUnitID,
      'smallestUnitName': smallestUnitName,
      'status': status,
      'publicPurchasePrice': publicPurchasePrice,
      'thumbnail': thumbnail,
    };
  }
}
