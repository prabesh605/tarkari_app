class CustomerOrder {
  final Mast mast;

  CustomerOrder({required this.mast});

  Map<String, dynamic> toJson() => {
        "mast": mast.toJson(),
      };
}

class Mast {
  final int orderInfoMasterID;
  final String fullname;
  final String mobileNo;
  final String address;
  final String email;
  final String lat;
  final String lon;
  final List<Detail> details;

  Mast({
    required this.orderInfoMasterID,
    required this.fullname,
    required this.mobileNo,
    required this.address,
    required this.email,
    required this.lat,
    required this.lon,
    required this.details,
  });

  Map<String, dynamic> toJson() => {
        "orderInfoMasterID": orderInfoMasterID,
        "fullname": fullname,
        "mobileNo": mobileNo,
        "address": address,
        "email": email,
        "lat": lat,
        "lon": lon,
        "details": details.map((d) => d.toJson()).toList(),
      };
}

class Detail {
  final int orderInfoDetailID;
  final int orderInfoMasterID;
  final int materialInfoID;
  final int measuringUnitID;
  final int quantity;

  Detail(
      {required this.orderInfoDetailID,
      required this.orderInfoMasterID,
      required this.measuringUnitID,
      required this.materialInfoID,
      required this.quantity});

  Map<String, dynamic> toJson() => {
        "orderInfoDetailID": orderInfoDetailID,
        "orderInfoMasterID": orderInfoMasterID,
        "materialInfoID": materialInfoID,
        "measuringUnitID": measuringUnitID,
        "quantity": quantity,
      };
}
