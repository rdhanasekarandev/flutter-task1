import 'package:trips_list_view/api/get_booking_modal.dart';
import 'package:trips_list_view/api/get_booking_repository.dart';
import 'package:trips_list_view/viewmodel/booking_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class GetBookingDetailsBloc{
  final bookingList = BehaviorSubject<List<BookingDetailModal>>();
  final GetBookingDetailsRepository getBookingDetailsRepository;

  GetBookingDetailsBloc({
    @required this.getBookingDetailsRepository,
  }) {
    getRepos()
        .then(toViewModel)
        .then(bookingList.add)
        .catchError((err) => print('Error getting repo $err'));
  }

  Future<List<Booking>> getRepos() {
    return getBookingDetailsRepository.getCurrent();
  }

  List<BookingDetailModal> toViewModel(List<Booking> dataModelList) {
    return dataModelList
        .map(
          (dataModel) =>
          BookingDetailModal(
              basePrice: dataModel.baseFare,
              startAt: dataModel.pickUpLocation ,
              dropAt: dataModel.dropOffLocation,
              tripStatus: dataModel.tripStatus,
              updatedAt: dataModel.driverDetails.vehicleDetails.vehicleCategoryDetails.updatedAt,
              image: dataModel.riderDetails.picture,
              categoryImage: dataModel.driverDetails.vehicleDetails.vehicleCategoryDetails.categoryImage,
              categoryType: dataModel.driverDetails.vehicleDetails.vehicleCategoryDetails.categoryName,
              paymentType: dataModel.paymentType
          ),
         ).toList(growable: false);
  }

  void dispose() {
    bookingList.close();
  }
}