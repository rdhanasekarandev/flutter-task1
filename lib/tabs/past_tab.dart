import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips_list_view/api/get_booking_repository.dart';
import 'package:trips_list_view/bloc/get_booking_detail_bloc.dart';
import 'package:trips_list_view/viewmodel/booking_data.dart';

class PastTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provider<GetBookingDetailsBloc>(
          builder: (_)=>GetBookingDetailsBloc(getBookingDetailsRepository: GetBookingDetailsRepository()),
          dispose: (_,bloc)=>bloc.dispose(),
          child: BookingDetailsList()
      ),
    );
  }
}

class BookingDetailsList extends StatefulWidget {
  @override
  _BookingDetailsListState createState() => _BookingDetailsListState();
}

class _BookingDetailsListState extends State<BookingDetailsList> {
  TextStyle textStyle = TextStyle(color: Colors.white);
  TextStyle textStyleone = TextStyle(color: Colors.black);
  TextStyle textStyletwo = TextStyle(color: Colors.white,fontSize: 10,fontFamily: 'Poppins Regular');
  TextStyle textStylethree = TextStyle(color: Colors.grey,fontSize: 11,fontFamily: 'Poppins Regular');
  TextStyle textStylesix = TextStyle(color: Colors.grey,fontSize: 10,fontFamily: 'Poppins Regular');

  TextStyle textStylefour = TextStyle(color: Colors.black,fontSize: 10,fontFamily: 'Poppins Bold');

  TextStyle textStylefive = TextStyle(color: Colors.black,fontSize: 11,fontFamily: 'Poppins Bold');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Provider.of<GetBookingDetailsBloc>(context).bookingList,
        builder: (context,repoSnapshot){

          if(!repoSnapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final list=repoSnapshot.data as List<BookingDetailModal>;

          return buildBookingDetailsList(list);
        }
    );
  }

  Widget buildBookingDetailsList(List<BookingDetailModal> bookingDetailModel){
    return ListView.builder(
        itemCount: bookingDetailModel.length,
        itemBuilder:(BuildContext context, int i){
          return bookingDetailItem(bookingDetailModel[i]);
        }
    );
  }

  Widget bookingDetailItem(BookingDetailModal bookingData){
    return Container(
      width: double.infinity,
      child: Card(
        child: Container(
            padding: EdgeInsets.all(10),
            child: new Column(
              children: [
                new Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Text(bookingData.basePrice.toString(),style: textStyletwo,),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Text("\$"+"150",style: textStylefour,),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: new Row(
                            children: [
                              Expanded(child: Container()),
                              Image.asset("assets/images/time.png",height: 15,color: Colors.grey,),
                              Container(
                                  padding: EdgeInsets.only(left: 3),
                                  child: Text("2020-10-14 11:15",style: textStylethree,)
                              ),
                              Expanded(child: Container())
                            ]
                        )
                        ,
                      ),
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    child:new Row(
                      children: [
                        Container(
                          height: 60,
                          padding: EdgeInsets.only(top: 1,bottom: 3),
                          child: Image.asset("assets/images/design.png",width: 15,height: 60,),
                        ),
                        Expanded(
                          child:Container(
                            padding: EdgeInsets.only(left: 10,),
                            height: 60,
                            child: new Stack(
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      padding: EdgeInsets.all(0),
                                      child: Text("799, TNHB, Mela Annuppanadi, Madurai 625009.",style: textStylefive,overflow: TextOverflow.ellipsis,),
                                    )
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    padding: EdgeInsets.all(0),
                                    child: Text("799, TNHB, Mela Annuppanadi, Madurai 625009.",style: textStylefive,overflow: TextOverflow.ellipsis,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Image.asset("assets/images/user.png",width: 60,height: 60,color: Colors.grey,),
                        )
                      ],
                    )
                ),
                Container(
                  width: double.infinity,
                  child:  new Row(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: new Row(
                            children: [
                              Container(
                                height: 30,
                                child: Image.asset("assets/images/car.png"),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("Micro",style: textStylethree,),
                                ),
                              )
                            ],
                          )
                      ),
                      Expanded(child: Container()),
                      Align(
                          alignment: Alignment.centerRight,
                          child: new Row(
                            children: [
                              Container(
                                height: 13,
                                child: Image.asset("assets/images/dollar.png",color: Colors.grey,),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("Cash",style: textStylethree,),
                                ),
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}

