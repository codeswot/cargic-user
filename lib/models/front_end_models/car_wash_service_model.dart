class CarWashTypeModel {
  bool isSelected;
  final String carWashServiceImage;
  final String carWashServiceName;
  final String carWashServicePrice;
  final String carWashServiceDiscount;

  CarWashTypeModel(
      {this.carWashServicePrice,
      this.carWashServiceDiscount,
      this.isSelected,
      this.carWashServiceImage,
      this.carWashServiceName});
}
