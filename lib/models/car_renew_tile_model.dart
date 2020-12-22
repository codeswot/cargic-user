class CarRenewTileModel {
  bool isSelected;
  int itemCount;
  int itemPrice;
  final bool isMultiSelect;
  final String paperName;
  CarRenewTileModel(
      {this.itemPrice,
      this.isMultiSelect,
      this.paperName,
      this.itemCount,
      this.isSelected});
}
