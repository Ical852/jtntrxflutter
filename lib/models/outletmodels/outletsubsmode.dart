//@dart=2.9

class OutletSubsModel {
  String id;
  String outletName;
  String parentId;
  String orderId;

  OutletSubsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    outletName = json["outlet_name"];
    parentId = json["parent_id"];
    orderId = json["order_id"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "outlet_name": outletName,
      "parent_id": parentId,
      "order_id": orderId,
    };
  }
}