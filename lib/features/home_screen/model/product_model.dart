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
  final List<Materials> materials;

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
      materials: List<Materials>.from(
        json['materials'].map((item) => Materials.fromJson(item)),
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

  static const String kTableName = "ProductSubCategory";

  static const String kTableCreationQuery = '''
   CREATE TABLE $kTableName (
   productSubCategoryID INTEGER PRIMARY KEY,
   subCategoryName TEXT,
   subCategoryCode TEXT
   );
   ''';

  Map<String, dynamic> toDB() => {
        'productSubCategoryID': productSubCategoryID,
        'subCategoryName': subCategoryName,
        'subCategoryCode': subCategoryCode,
      };
}

class Materials {
  final int materialInfoID;
  final String fullName;
  final String code;
  final int productSubCategoryID;
  final int smallestUnitID;
  final String smallestUnitName;
  final int status;
  final double publicPurchasePrice;
  final String thumbnail;

  Materials({
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

  factory Materials.fromJson(Map<String, dynamic> json) {
    return Materials(
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
  factory Materials.fromDB(Map<String, dynamic> dbData) {
    return Materials(
      materialInfoID: dbData['materialInfoID'],
      fullName: dbData['fullName'],
      code: dbData['code'],
      productSubCategoryID: dbData['productSubCategoryID'],
      smallestUnitID: dbData['smallestUnitID'],
      smallestUnitName: dbData['smallestUnitName'],
      status: dbData['status'],
      publicPurchasePrice: dbData['publicPurchasePrice'],
      thumbnail: dbData['thumbnail'],
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

  static const String kTableName = "Material";
  static const String kTableCreationQuery = '''
    CREATE TABLE $kTableName (
      materialInfoID INTEGER PRIMARY KEY,
      fullName TEXT,
      code TEXT,
      productSubCategoryID INTEGER,
      smallestUnitID INTEGER,
      smallestUnitName TEXT,
      status INTEGER,
      publicPurchasePrice REAL,
      thumbnail TEXT
    );
    ''';
  Map<String, dynamic> toDB() => {
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
