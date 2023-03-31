import 'package:boat_owner/app/modeules/add_boat/controller/step_1controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../singaltonClass.dart';
import '../../global_widgets/custom_button.dart';
import '../../themes/styles/textstyle.dart';
import '../booking_boat/upcoming_booking/controller.dart';

class Booking_page extends StatefulWidget {
  Booking_page({this.uid, this.status});

  var uid;
  var status;

  @override
  State<Booking_page> createState() => _Booking_pageState();
}

class _Booking_pageState extends State<Booking_page> {
  int currentIndex = 2;
  final con = Get.put(Step_1Controller());
  final con1 = Get.put(done_booking());
  done_booking service = done_booking();
  final FirebaseAuth auth = FirebaseAuth.instance;
  var total_rating;
  int? i;
  var data;
  String? status;
  var getid;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    con1.initRetrieval();
    // TODO: implement initState
    super.initState();
  }

  var review_data;
  var id;
  final firestore = FirebaseFirestore.instance.collection("bookingRequestSend");
  final databaseRef = FirebaseFirestore.instance
      .collection("bookingRequestSend")
      .where('uid', isEqualTo: SessionController().userId)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          const SizedBox(height: 32),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text("Order".tr, style: AppTextStyles.ktitle)),
          StreamBuilder<QuerySnapshot>(
            stream: databaseRef,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const Text('FireStore fddrgdg DAta Load Errorr');
              } else {
                return Expanded(
                    child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final String id =
                        snapshot.data!.docs[index]['id'] ?? "".toString();
                    var hrs =
                        snapshot.data!.docs[index]['hours'] ?? "".toString();
                    var price =
                        snapshot.data!.docs[index]['price'] ?? "".toString();
                    var request =
                        snapshot.data!.docs[index]['request'] ?? "".toString();
                    var date =
                        snapshot.data!.docs[index]['date'] ?? "".toString();
                    var imgurl =
                        snapshot.data!.docs[index]['imgurl'] ?? "".toString();

                    var startTime = snapshot.data!.docs[index]['starttime'] ??
                        "".toString();
                    var endTime =
                        snapshot.data!.docs[index]['endtime'] ?? "".toString();
                    var boatName =
                        snapshot.data!.docs[index]['boatname'] ?? "".toString();
                    var paymentmethod = snapshot.data!.docs[index]
                            ['paymethod'] ??
                        "".toString();
                    var paymentverify = snapshot.data!.docs[index]
                            ['paymentverify'] ??
                        "".toString();
                    return Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 90.h,
                                      width: 90.w,
                                      color: Colors.green,
                                      child: Image.network(
                                        imgurl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    //
                                    // Image.network(
                                    //           "${retrievedboatsList?[index].image}",
                                    //           width: 76,
                                    //           height: 80,
                                    //           fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Booking ID: $id",
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 11),
                                        ),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment
                                        //           .spaceBetween,
                                        //   children: const [
                                        //     Text(
                                        //       "View Details",
                                        //       style: TextStyle(
                                        //           color: Colors.white,
                                        //           fontWeight:
                                        //               FontWeight.w600,
                                        //           fontSize: 11),
                                        //     ),
                                        //     Icon(
                                        //         Icons
                                        //             .arrow_forward_ios_outlined,
                                        //         color: Colors.white,
                                        //         size: 15)
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 7.h,
                                    ),
                                    Text("$boatName", style: AppTextStyles.h1),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          " $startTime to $endTime ",
                                          style: AppTextStyles.kPrimaryS7W4,
                                        ),
                                        SizedBox(
                                          width: 35,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 60.w),
                                          child: Text(
                                            date,
                                            style: AppTextStyles.kPrimaryS7W4,
                                          ),
                                        ),
                                      ],
                                    ),
                                    //   const SizedBox(height: 2),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        request == "pending"
                                            ? Container(
                                                child: Row(
                                                  children: [
                                                    Listener(
                                                      onPointerDown: (event) {},
                                                      child: Container(
                                                        width: 100.w,
                                                        height: 40.h,
                                                        child: BlueBtn(
                                                          onPressed: () {
                                                            firestore
                                                                .doc(id)
                                                                .update({
                                                              'request':
                                                                  "accept"
                                                            });
                                                            setState(() {});
                                                          },
                                                          title: "Accept",
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                      width: 100.w,
                                                      height: 40.h,
                                                      child: BlueBtn(
                                                        onPressed: () {
                                                          firestore
                                                              .doc(id)
                                                              .update({
                                                            'request': "cancel"
                                                          });
                                                          setState(() {});
                                                        },
                                                        title: "Cancel",
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : request == "accept"
                                                ? Center(
                                                    child: Text(
                                                        "Request Accepted",
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.green)),
                                                  )
                                                : Center(
                                                    child: Text(
                                                        "Request Cancel",
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.red)),
                                                  )
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    paymentmethod == "cash"
                                        ? Row(
                                            children: [
                                              paymentverify != "verify"
                                                  ? Container(
                                                      height: 40,
                                                      width: 100,
                                                      child: BlueBtn(
                                                        onPressed: () {
                                                          firestore
                                                              .doc(id)
                                                              .update({
                                                            'paymentverify':
                                                                "verify"
                                                          });
                                                          setState(() {});
                                                        },
                                                        title: "Verify",
                                                      ),
                                                    )
                                                  : Row(
                                                      children: [
                                                        Text("Verified",
                                                            style: const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .green)),
                                                        SizedBox(
                                                          width: 2.w,
                                                        ),
                                                        Icon(
                                                          Icons.check,
                                                          color: Colors.green,
                                                          size: 18.h,
                                                        )
                                                      ],
                                                    ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Text("Cash Payment \$$price",
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.blue)),
                                            ],
                                          )
                                        : Text("UnPaid \$$price",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.blue)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Container(
                                margin:
                                    const EdgeInsets.only(left: 34, right: 24),
                                width: double.infinity,
                                height: 1,
                                color: Colors.white)
                          ],
                        ),
                      ),
                    );

                    // Card(
                    //     child: ListTile(
                    //   leading: Image.asset(
                    //     mastercardIcon,
                    //     height: 30,
                    //     width: 50,
                    //   ),
                    //   title: Text(" $hrs"),
                    //   subtitle: Text(price.toString()),
                    //   trailing: Text(snapshot.data!.docs[index]['request']),
                    // ));
                  },
                ));
              }
            },
          ),
        ]),
      ),
    );

    //       //  RefreshIndicator(
    //       //   key: _refreshIndicatorKey,
    //       //   onRefresh: () {
    //       //     return con1.initRetrieval();
    //       //   },
    //       //   child: Padding(
    //       //     padding: const EdgeInsets.only(left: 16.0),
    //       //     child: Column(
    //       //       crossAxisAlignment: CrossAxisAlignment.start,
    //       //       children: [
    //       //         const SizedBox(
    //       //           height: 42,
    //       //         ),
    //       //         Text("My Bookings".tr, style: AppTextStyles.ktitle),
    //       //         const SizedBox(height: 30),
    //       //         Expanded(
    //       //           child: FutureBuilder(
    //       //             future: con1.boats,
    //       //             builder: (BuildContext context, AsyncSnapshot<List<Booking_Boats>> snapshot) {
    //       //               if (snapshot.data == null) {
    //       //                 return Center(
    //       //                   child: Image.asset(
    //       //                     'assets/no_results.png',
    //       //                     width: 112,
    //       //                     height: 112,
    //       //                   ),
    //       //                 );
    //       //               }
    //       //               if (snapshot.data!.isEmpty) {
    //       //                 return Center(
    //       //                     child: Column(
    //       //                   mainAxisAlignment: MainAxisAlignment.center,
    //       //                   children: [
    //       //                     Image.asset(
    //       //                       'assets/no_results.png',
    //       //                       width: 112,
    //       //                       height: 112,
    //       //                     ),
    //       //                     SizedBox(height: 15),
    //       //                     GestureDetector(onTap: () {}, child: Text("No Boats".tr, style: TextStyle(color: Colors.blue, fontSize: 16)))
    //       //                   ],
    //       //                 ));
    //       //               }
    //       //               if (snapshot.hasError) {
    //       //                 return Text('Something went wrong'.tr);
    //       //               }

    //       //               if (snapshot.connectionState == ConnectionState.waiting) {
    //       //                 return Center(child: CircularProgressIndicator());
    //       //               }

    //       //               return ListView.separated(
    //       //                   itemCount: con1.retrievedboats!.length,
    //       //                   separatorBuilder: (context, index) => const SizedBox(
    //       //                         height: 20,
    //       //                       ),
    //       //                   itemBuilder: (context, index) {
    //       //                     return Column(
    //       //                       children: [
    //       //                         Row(
    //       //                           children: [
    //       //                             Padding(
    //       //                               padding: const EdgeInsets.all(7.0),
    //       //                               child: ClipRRect(
    //       //                                   borderRadius: BorderRadius.circular(10),
    //       //                                   child: CachedNetworkImage(
    //       //                                     imageUrl: "${con1.retrievedboats![index].image}",
    //       //                                     width: 70,
    //       //                                     height: 75,
    //       //                                     fit: BoxFit.cover,
    //       //                                   )),
    //       //                             ),
    //       //                             Column(
    //       //                               crossAxisAlignment: CrossAxisAlignment.start,
    //       //                               children: [
    //       //                                 Container(
    //       //                                   width: MediaQuery.of(context).size.width / 1.6,
    //       //                                   height: 29,
    //       //                                   decoration: BoxDecoration(
    //       //                                     color: AppColors.blue_con,
    //       //                                     borderRadius: BorderRadius.circular(17),
    //       //                                   ),
    //       //                                   child: Row(
    //       //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       //                                     children: [
    //       //                                       Padding(
    //       //                                         padding: const EdgeInsets.only(left: 8.0),
    //       //                                         child: Text(
    //       //                                           "Booking ID: ${con1.retrievedboats![index].booking_id!.substring(0, 7)}",
    //       //                                           style: TextStyle(color: Colors.white, fontSize: 11),
    //       //                                         ),
    //       //                                       ),
    //       //                                       Row(
    //       //                                         children: [
    //       //                                           GestureDetector(
    //       //                                             onTap: () async {
    //       //                                               var rating = con1.retrievedboats![index].rating;
    //       //                                               var data;
    //       //                                               await FirebaseFirestore.instance
    //       //                                                   .collection('boats')
    //       //                                                   .doc(rating)
    //       //                                                   .get()
    //       //                                                   .then((doc) => {data = doc.data()})
    //       //                                                   .catchError((error) =>
    //       //                                                       {debugPrint("Error on get data from User"), print(error.toString())});

    //       //                                               total_rating = data['total_rating'];
    //       //                                               Get.to(Booking_detalis(
    //       //                                                 inde: index,
    //       //                                                 rating: total_rating,
    //       //                                                 checking_completeing:
    //       //                                                     con1.retrievedboats![index].booking_status != '● Completed' ? true : false,
    //       //                                               ));
    //       //                                             },
    //       //                                             child: Text(
    //       //                                               "View Details".tr,
    //       //                                               style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 11),
    //       //                                             ),
    //       //                                           ),
    //       //                                           Icon(
    //       //                                             Icons.arrow_forward_ios_outlined,
    //       //                                             color: Colors.white,
    //       //                                             size: 15
    //       //                                           )
    //       //                                         ],
    //       //                                       ),
    //       //                                     ],
    //       //                                   ),
    //       //                                 ),
    //       //                                 SizedBox(
    //       //                                   height: 7
    //       //                                 ),
    //       //                                 Text(
    //       //                                   "${con1.retrievedboats![index].boat_name}",
    //       //                                   style: AppTextStyles.kPrimaryS5W4,
    //       //                                 ),
    //       //                                 SizedBox(
    //       //                                   height: 5
    //       //                                 ),
    //       //                                 SizedBox(
    //       //                                   width: MediaQuery.of(context).size.width / 1.7,
    //       //                                   child: Row(
    //       //                                     children: [
    //       //                                       Text(
    //       //                                         "${con1.retrievedboats![index].start_time} to ${con1.retrievedboats![index].end_time} ",
    //       //                                         style: AppTextStyles.kPrimaryS7W4
    //       //                                       )
    //       //                                     ],
    //       //                                   ),
    //       //                                 ),
    //       //                                 const SizedBox(
    //       //                                   height: 5
    //       //                                 ),
    //       //                                 SizedBox(
    //       //                                   width: MediaQuery.of(context).size.width / 1.7,
    //       //                                   child: Row(
    //       //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       //                                     children: [
    //       //                                       con1.retrievedboats![index].booking_status != '● Completed'
    //       //                                           ? GestureDetector(
    //       //                                               onTap: () async {
    //       //                                                 FirebaseFirestore.instance
    //       //                                                     .collection('Users')
    //       //                                                     .doc(auth.currentUser!.uid)
    //       //                                                     .update({'total_bookings': FieldValue.increment(1)});
    //       //                                                 Fluttertoast.showToast(
    //       //                                                     msg: "Booking will complete after some time",
    //       //                                                     toastLength: Toast.LENGTH_SHORT,
    //       //                                                     gravity: ToastGravity.BOTTOM_RIGHT,
    //       //                                                     timeInSecForIosWeb: 1,
    //       //                                                     backgroundColor: Colors.black,
    //       //                                                     textColor: Colors.white,
    //       //                                                     fontSize: 16.0);

    //       //                                                 getid = con1.retrievedboats![index].documnet_id;

    //       //                                                 FirebaseFirestore.instance
    //       //                                                     .collection('booking_request')
    //       //                                                     .doc(con1.retrievedboats![index].sender_user_uid)
    //       //                                                     .collection('allrequest')
    //       //                                                     .doc(con1.retrievedboats![index].doc_id)
    //       //                                                     .update({
    //       //                                                   'booking_status': '● Completed',
    //       //                                                 });
    //       //                                                 FirebaseFirestore.instance
    //       //                                                     .collection('booking_requestforowner')
    //       //                                                     .doc(auth.currentUser!.uid)
    //       //                                                     .collection('allrequest')
    //       //                                                     .doc(con1.retrievedboats![index].doc_id)
    //       //                                                     .update({
    //       //                                                   'booking_status': '● Completed',
    //       //                                                 });
    //       //                                               },
    //       //                                               child: Container(
    //       //                                                 padding: EdgeInsets.all(5),
    //       //                                                 decoration: BoxDecoration(
    //       //                                                   borderRadius: BorderRadius.circular(6),
    //       //                                                   border: Border.all(width: 1, color: AppColors.Sdark_blue),
    //       //                                                 ),
    //       //                                                 child:  Text(
    //       //                                                   "Complete".tr,
    //       //                                                   style: const TextStyle(
    //       //                                                       color: AppColors.Sdark_blue, fontSize: 13, fontWeight: FontWeight.bold),
    //       //                                                 ),
    //       //                                               ))
    //       //                                           : Text(
    //       //                                               " ${con1.retrievedboats![index].booking_status}",
    //       //                                               style: const TextStyle(color: AppColors.Sdark_blue),
    //       //                                             ),
    //       //                                       con1.retrievedboats![index].booking_status != '● Completed'
    //       //                                           ? GestureDetector(
    //       //                                               onTap: () {
    //       //                                                 Fluttertoast.showToast(
    //       //                                                     msg: "Booking Cancelled".tr,
    //       //                                                     toastLength: Toast.LENGTH_SHORT,
    //       //                                                     gravity: ToastGravity.BOTTOM_RIGHT,
    //       //                                                     timeInSecForIosWeb: 1,
    //       //                                                     backgroundColor: Colors.black,
    //       //                                                     textColor: Colors.white,
    //       //                                                     fontSize: 16.0);
    //       //                                                 getid = con1.retrievedboats![index].documnet_id;
    //       //                                                 FirebaseFirestore.instance
    //       //                                                     .collection('booking_request')
    //       //                                                     .doc(con1.retrievedboats![index].sender_user_uid)
    //       //                                                     .collection('allrequest')
    //       //                                                     .doc(con1.retrievedboats![index].doc_id)
    //       //                                                     .delete();
    //       //                                                 FirebaseFirestore.instance
    //       //                                                     .collection('booking_requestforowner')
    //       //                                                     .doc(auth.currentUser!.uid)
    //       //                                                     .collection('allrequest')
    //       //                                                     .doc(con1.retrievedboats![index].doc_id)
    //       //                                                     .delete();
    //       //                                               },
    //       //                                               child:  Text("Cancel Booking".tr, style: AppTextStyles.kPrimaryS9W5),
    //       //                                             )
    //       //                                           : Text("")
    //       //                                     ],
    //       //                                   ),
    //       //                                 )
    //       //                               ],
    //       //                             ),
    //       //                           ],
    //       //                         ),
    //       //                         const SizedBox(height: 4),
    //       //                         Padding(
    //       //                           padding: const EdgeInsets.only(left: 18.0),
    //       //                           child: Divider_con(),
    //       //                         ),
    //       //                         // Row(
    //       //                         //   children: [
    //       //                         //     Padding(
    //       //                         //       padding: const EdgeInsets.all(7.0),
    //       //                         //       child: ClipRRect(
    //       //                         //           borderRadius: BorderRadius.circular(10),
    //       //                         //           child: Image.asset(
    //       //                         //             "assets/Bitmap.png",
    //       //                         //             width: 70,
    //       //                         //             height: 75,
    //       //                         //             fit: BoxFit.cover,
    //       //                         //           )),
    //       //                         //     ),
    //       //                         //     Column(
    //       //                         //       crossAxisAlignment: CrossAxisAlignment.start,
    //       //                         //       children: [
    //       //                         //         GestureDetector(
    //       //                         //           onTap: () {
    //       //                         //             Get.to(Booking_detalis());
    //       //                         //           },
    //       //                         //           child: Container(
    //       //                         //             width: MediaQuery.of(context).size.width / 1.7,
    //       //                         //             height: 29,
    //       //                         //             decoration: BoxDecoration(
    //       //                         //               color: AppColors.blue_con,
    //       //                         //               borderRadius: BorderRadius.circular(17),
    //       //                         //             ),
    //       //                         //             child: Row(
    //       //                         //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       //                         //               children: [
    //       //                         //                 Padding(
    //       //                         //                   padding: const EdgeInsets.only(left: 8.0),
    //       //                         //                   child: const Text(
    //       //                         //                     "Booking ID: 123456",
    //       //                         //                     style:
    //       //                         //                     TextStyle(color: Colors.white, fontSize: 11),
    //       //                         //                   ),
    //       //                         //                 ),
    //       //                         //                 Row(
    //       //                         //                   children: const [
    //       //                         //                     Text(
    //       //                         //                       "View Details",
    //       //                         //                       style: TextStyle(
    //       //                         //                           color: Colors.white,
    //       //                         //                           fontWeight: FontWeight.w600,
    //       //                         //                           fontSize: 11),
    //       //                         //                     ),
    //       //                         //                     Icon(
    //       //                         //                       Icons.arrow_forward_ios_outlined,
    //       //                         //                       color: Colors.white,
    //       //                         //                       size: 15,
    //       //                         //                     )
    //       //                         //                   ],
    //       //                         //                 ),
    //       //                         //               ],
    //       //                         //             ),
    //       //                         //           ),
    //       //                         //         ),
    //       //                         //         SizedBox(
    //       //                         //           height: 7,
    //       //                         //         ),
    //       //                         //         const Text(
    //       //                         //           "Boat Name",
    //       //                         //           style: AppTextStyles.kPrimaryS5W4,
    //       //                         //         ),
    //       //                         //         SizedBox(
    //       //                         //           height: 5,
    //       //                         //         ),
    //       //                         //         SizedBox(
    //       //                         //           width: MediaQuery.of(context).size.width / 1.7,
    //       //                         //           child: Row(
    //       //                         //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       //                         //             children: const [
    //       //                         //               Text(
    //       //                         //                 "3:00 PM to 7:00 PM ",
    //       //                         //                 style: AppTextStyles.kPrimaryS7W4,
    //       //                         //               ),
    //       //                         //               Text(
    //       //                         //                 " 03/06/2022 ",
    //       //                         //                 style: AppTextStyles.kPrimaryS7W4,
    //       //                         //               ),
    //       //                         //             ],
    //       //                         //           ),
    //       //                         //         ),
    //       //                         //         const SizedBox(
    //       //                         //           height: 5,
    //       //                         //         ),
    //       //                         //         SizedBox(
    //       //                         //           width: MediaQuery.of(context).size.width / 1.7,
    //       //                         //           child: Row(
    //       //                         //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       //                         //             children: [
    //       //                         //               Row(
    //       //                         //                 children: [
    //       //                         //                   Text(
    //       //                         //                     "● Completed ",
    //       //                         //                     style: TextStyle(
    //       //                         //                         color: AppColors.Sdark_blue,
    //       //                         //                         fontWeight: FontWeight.w400,
    //       //                         //                         fontSize: 14),
    //       //                         //                   )
    //       //                         //                 ],
    //       //                         //               ),
    //       //                         //               Row(
    //       //                         //                 children: const [
    //       //                         //                   Icon(
    //       //                         //                     Icons.star,
    //       //                         //                     color: Color(0xff494AFF),
    //       //                         //                     size: 15,
    //       //                         //                   ),
    //       //                         //                   Icon(
    //       //                         //                     Icons.star,
    //       //                         //                     color: Color(0xff494AFF),
    //       //                         //                     size: 15,
    //       //                         //                   ),
    //       //                         //                   Icon(
    //       //                         //                     Icons.star,
    //       //                         //                     color: Color(0xff494AFF),
    //       //                         //                     size: 15,
    //       //                         //                   ),
    //       //                         //                   Icon(
    //       //                         //                     Icons.star,
    //       //                         //                     color: Color(0xff494AFF),
    //       //                         //                     size: 15,
    //       //                         //                   ),
    //       //                         //                   Icon(
    //       //                         //                     Icons.star_border,
    //       //                         //                     color: Colors.grey,
    //       //                         //                     size: 15,
    //       //                         //                   ),
    //       //                         //                 ],
    //       //                         //               ),
    //       //                         //             ],
    //       //                         //           ),
    //       //                         //         )
    //       //                         //       ],
    //       //                         //     ),
    //       //                         //   ],
    //       //                         // ),
    //       //                         // const SizedBox(height: 4),
    //       //                         // const Padding(
    //       //                         //   padding: EdgeInsets.only(left: 18.0),
    //       //                         //   child: Divider_con(),
    //       //                         // )
    //       //                       ],
    //       //                     );
    //       //                   });
    //       //             },
    //       //           ),
    //       //         ),
    //       //       ],
    //       //     ),
    //       //   ),
    //       // ),
    //       ),
    // );
  }
}
