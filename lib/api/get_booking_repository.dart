import 'get_booking_modal.dart';
import 'package:graphql/client.dart';
import 'graphql_client.dart';

class GetBookingDetailsRepository{
  Future<List<Booking>> getCurrent(){
    return getGraphqlClient().query(_queryOptions()).then(_toGetBookingDetailsRepository);
  }

  QueryOptions _queryOptions() {
    return QueryOptions(
      document: readQuery,
      variables: <String, dynamic>{
        "currentPage": 1,
        "requestType": "previous"
      },
    );
  }

  List<Booking> _toGetBookingDetailsRepository(QueryResult queryResult) {
    if (queryResult.hasException) {
      throw Exception();
    }

    final list =
    queryResult.data['getBookings']['results']['bookings'] as List<dynamic>;

    return list
        .map((repoJson) => Booking.fromJson(repoJson))
        .toList(growable: false);
  }
}

const String readQuery = r'''
query getBookings($currentPage: Int!, $requestType: String!){
  getBookings(currentPage: $currentPage, requestType: $requestType) {
    results {
        bookings {
            id
            riderLocation
            riderLocationLat
            riderLocationLng
    isSpecialTrip
            specialTripPrice
          
         specialTripTotalFare
   isTipGiven
           tipsAmount
          
          tipsTotalFare
  tipsDriverTotalFare
   pickUpLocation
            pickUpLat
            pickUpLng
            dropOffLocation
            dropOffLat
            dropOffLng
            riderId
            driverId
            tripStatus
            vehicleType     
            totalRideDistance
            baseFare
            baseUnit
            riderServiceFee
            riderTotalFare
            driverTotalFare
            driverServiceFee
            estimatedTotalFare
            totalFare
            totalDuration
            paymentType
            paymentStatus
            transactionId
            startDate
            currency
            startTime
            endDate
            endTime
            tripStart
            tripEnd
            riderDetails {
                userId
                userData {
                    lat
                    lng 
                  overallRating
                  phoneNumber
                }
                firstName
                lastName
                picture
                location
              
              
         }
        
            driverDetails {
                userId
                userData {
                    lat
                    lng 
                  overallRating
                  phoneNumber

                }
                firstName
                lastName
                picture
                location
               vehicleDetails {
                  id
                  vehicleName
                vehicleCategoryDetails {
		              id
                  categoryName
                  categoryImage
                  categoryMarkerImage
                  unitPrice
                  basePrice
                  isActive
                  currency
                  createdAt
                  updatedAt
                }
              }
            }
        }
      count
    }    
    status
    errorMessage
  }
}
''';