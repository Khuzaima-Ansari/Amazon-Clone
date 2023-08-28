// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderRequestModel {
  final String orderName;
  final String buyersAddress;

  OrderRequestModel({
    required this.orderName,
    required this.buyersAddress,
  });

  Map<String, dynamic> getJson() => {
        'orderName': orderName,
        'buyersAddress': buyersAddress,
      };

  factory OrderRequestModel.getModelFromJson(
      {required Map<String, dynamic> json}) {
    return OrderRequestModel(
        orderName: json['orderName'], buyersAddress: json['buyersAddress']);
  }
}
