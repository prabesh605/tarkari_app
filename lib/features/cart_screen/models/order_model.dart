class CustomerOrder {
  final Mast mast;

  CustomerOrder({required this.mast});

  Map<String, dynamic> toJson() => {
        "mast": mast.toJson(),
      };
}

class Mast {
  final String fullname;
  final String mobileNo;
  final String address;
  final String email;
  final String lat;
  final String lon;
  final List<Detail> details;

  Mast({
    required this.fullname,
    required this.mobileNo,
    required this.address,
    required this.email,
    required this.lat,
    required this.lon,
    required this.details,
  });

  Map<String, dynamic> toJson() => {
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
  final int materialInfoID;
  final int quantity;

  Detail({required this.materialInfoID, required this.quantity});

  Map<String, dynamic> toJson() => {
        "materialInfoID": materialInfoID,
        "quantity": quantity,
      };
}
