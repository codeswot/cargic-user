class CartItemModel {
  int itemID;
  final String itemImage;
  final String itemName;
  final double itemPrice;
  final double itemRating;
  final int ratingNumber;

  CartItemModel(
      {this.itemID,
      this.ratingNumber,
      this.itemImage,
      this.itemName,
      this.itemPrice,
      this.itemRating});
}
