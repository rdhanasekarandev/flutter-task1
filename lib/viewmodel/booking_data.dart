import 'package:flutter/cupertino.dart';

class BookingDetailModal{
  final  int basePrice;
  final String startAt;
  final String dropAt;
  final String tripStatus;
  final String updatedAt;
  final String image;
  final String categoryImage;
  final String categoryType;
  final int paymentType;


  BookingDetailModal({
    @required this.basePrice,
    @required this.startAt,
    @required this.dropAt,
    @required this.tripStatus,
    @required this.updatedAt,
    @required this.image,
    @required this.categoryImage,
    @required this.categoryType,
    @required this.paymentType
  });
}