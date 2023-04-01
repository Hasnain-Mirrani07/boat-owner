import 'package:boat_owner/app/modeules/add_boat/add_boat_step1.dart';
import 'package:boat_owner/app/modeules/booking_boat/booking_details.dart';
import 'package:boat_owner/app/modeules/booking_boat/upcoming_booking/controller.dart';
import 'package:boat_owner/app/themes/AppColors.dart';
import 'package:boat_owner/app/themes/styles/textstyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../singaltonClass.dart';
import '../../../models/bookings_boats.dart';

class Upcoming_Bookings extends StatefulWidget {
  Upcoming_Bookings(this.uid);

  String? uid;

  @override
  State<Upcoming_Bookings> createState() => _Upcoming_BookingsState();
}

class _Upcoming_BookingsState extends State<Upcoming_Bookings> {
  int currentIndex = 0;
  final con1 = Get.put(done_booking());

  final con = Get.put(done_booking());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    SessionController().userId = _auth.currentUser!.uid;
    // TODO: implement initState
    super.initState();
  }

  final _db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  "Pending Bookings".tr,
                  style: AppTextStyles.kPrimaryS10W3,
                ),
                const SizedBox(height: 22),
//                 StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('pending_bookings')
//                       .doc("${widget.uid}")
//                       .collection('allpendingboats')
//                       .snapshots(),
//                   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                     if (snapshot.data == null) {
//                       return const Center(child: const CircularProgressIndicator.adaptive());
//                     }

//                     if (snapshot.data!.size == 0) {
//                       return Center(
//                           child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset('assets/no_results.png', width: 100, height: 100),
//                           const SizedBox(height: 15),
//                           GestureDetector(
//                               onTap: () {}, child: Text("No pending bookings".tr, style: TextStyle(color: Colors.blue, fontSize: 16)))
//                         ],
//                       ));
//                     }
//                     if (snapshot.hasError) {
//                       return const Text('Something went wrong');
//                     }

//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(child: const CircularProgressIndicator());
//                     }
//                     if (snapshot.data?.docs.isEmpty ?? true) {
//                       return GestureDetector(
//                           onTap: () {}, child: Text("No pending bookings".tr, style: TextStyle(color: Colors.blue, fontSize: 16)));
//                     }

//                     return Container(
//                       height: 177,
//                       child: ListView(
//                         scrollDirection: Axis.horizontal,
//                         children: snapshot.data!.docs.map((DocumentSnapshot document) {
//                           Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

//                           return Row(children: [
//                             Card(
//                               shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
//                               child: Column(
//                                 children: [
//                                   Stack(
//                                     alignment: Alignment.centerRight,
//                                     children: [
//                                       ClipRRect(
//                                           borderRadius: const BorderRadius.only(
//                                               topLeft: const Radius.circular(12), topRight: const Radius.circular(12)),
//                                           child: CachedNetworkImage(
//                                             imageUrl: "${data['pending_bimage']}",
//                                             fit: BoxFit.cover,
//                                             height: 132,
//                                             width: MediaQuery.of(context).size.width / 1.2,
//                                           )),
//                                       Padding(
//                                         padding: const EdgeInsets.only(right: 14.0),
//                                         child: Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             Text("1 Day".tr, style: AppTextStyles.kPrimaryS11W1),
//                                             const SizedBox(height: 10),
//                                             Text(
//                                               "${data['pending_bname']}",
//                                               style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 23, color: Colors.white),
//                                             ),
//                                             const SizedBox(height: 10),
//                                             Text("Boating Experiences".tr,
//                                                 style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white))
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Container(
//                                     width: MediaQuery.of(context).size.width / 1.2,
//                                     height: 37,
//                                     decoration: const BoxDecoration(
//                                       color: AppColors.blue_con,
//                                       borderRadius: BorderRadius.only(
//                                           bottomLeft: const Radius.circular(12), bottomRight: const Radius.circular(12)),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                             left: 12.0,
//                                           ),
//                                           child: Text(
//                                             "Starts at ${data['start_time']}:00 ",
//                                             style: const TextStyle(color: Colors.white, fontSize: 12),
//                                           ),
//                                         ),
//                                         Row(
//                                           children: [
//                                             Container(
//                                                 margin: const EdgeInsets.only(top: 8, bottom: 8),
//                                                 width: 65,
//                                                 height: 39,
//                                                 decoration: BoxDecoration(
//                                                     color: const Color(0xff000000).withOpacity(0.5),
//                                                     borderRadius: BorderRadius.circular(12)),
//                                                 child: Center(
//                                                   child: InkWell(
//                                                     onTap: () async {
//                                                       var id = document.id;
//                                                       _db
//                                                           .collection('pending_bookings')
//                                                           .doc("${widget.uid}")
//                                                           .collection('allpendingboats')
//                                                           .doc("$id")
//                                                           .delete();
//                                                     },
//                                                     child: const Padding(
//                                                       padding: EdgeInsets.all(2.0),
//                                                       child: Text("Decline", style: TextStyle(color: Colors.white, fontSize: 12)),
//                                                     ),
//                                                   ),
//                                                 )),
//                                             const SizedBox(width: 10),
//                                             InkWell(
//                                               onTap: () {
//                                                 con.getreview(data['documnet_idforeview']);
// //                                                  FcmPushNotiService.fetchFcmDetail(message: "Your Booking was Accepted", friendFcmToken:data['sender_token'], title:  data['pending_bname']);
//                                                 con.send_request(
//                                                     overview: data['overview'],
//                                                     documnet_id: data['documnet_idforeview'],
//                                                     boat_name: data['pending_bname'],
//                                                     image: data['pending_bimage'],
//                                                     uid: data['sender_uid'],
//                                                     booking_id: data['id'],
//                                                     start: data['start_time'],
//                                                     end: data['end_time'],
//                                                     total_amount: data['total_amount'],
//                                                     hours: data['hours_perday']);
//                                                 setState(() {
//                                                   con.sender_uid = data['sender_uid'];
//                                                 });
//                                                 con.initRetrieval(g: data['sender_uid']);
//                                                 var id = document.id;
//                                                 _db
//                                                     .collection('pending_bookings')
//                                                     .doc("${widget.uid}")
//                                                     .collection('allpendingboats')
//                                                     .doc("$id")
//                                                     .delete();
//                                               },
//                                               child: Container(
//                                                   margin: const EdgeInsets.only(right: 9, top: 8, bottom: 8),
//                                                   width: 64,
//                                                   height: 39,
//                                                   decoration: BoxDecoration(
//                                                       color: const Color(0xff000000).withOpacity(0.5),
//                                                       borderRadius: BorderRadius.circular(12)),
//                                                   child: Center(
//                                                     child: Padding(
//                                                       padding: const EdgeInsets.all(2.0),
//                                                       child:
//                                                           Text("Accept".tr, style: const TextStyle(color: Colors.white, fontSize: 12)),
//                                                     ),
//                                                   )),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(width: 14),
//                           ]);
//                         }).toList(),
//                       ),
//                     );
//                   },
//                 ),

                const SizedBox(
                  height: 42,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Upcoming Booking".tr,
                        style: AppTextStyles.kPrimaryS9W6),
                  ],
                ),
                const SizedBox(height: 11),
                FutureBuilder(
                  future: con1.boats,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Booking_Boats>> snapshot) {
                    if (snapshot.data == null) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 48.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(Add_boatStep1());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Add Boat ".tr,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                      color: Colors.blue),
                                ),
                                SizedBox(width: 6),
                                Icon(Icons.arrow_forward_ios,
                                    color: Colors.blue, size: 20)
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    if (snapshot.data!.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 48.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(Add_boatStep1());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Add Boat ".tr,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                      color: Colors.blue),
                                ),
                                SizedBox(width: 6),
                                Icon(Icons.arrow_forward_ios,
                                    color: Colors.blue, size: 20)
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return Text('Something went wrong'.tr);
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return Container(
                      height: 200,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: con1.retrievedboats!.length,
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 14,
                              ),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    var rating =
                                        con1.retrievedboats![index].rating;
                                    var data;
                                    await FirebaseFirestore.instance
                                        .collection('boats')
                                        .doc(rating)
                                        .get()
                                        .then((doc) => {data = doc.data()})
                                        .catchError((error) => {
                                              debugPrint(
                                                  "Error on get data from User"),
                                              print(error.toString())
                                            });

                                    var total_rating = data['total_rating'];

                                    Get.to(Booking_detalis(
                                      inde: index,
                                      rating: total_rating,
                                    ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              "${con1.retrievedboats![index].image}",
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.6,
                                          height: 105,
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12.0,
                                  ),
                                  child: Text(
                                    "${con1.retrievedboats![index].boat_name}",
                                    style: AppTextStyles.kPrimaryS5W4,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12.0,
                                  ),
                                  child: Text(
                                    "${con1.retrievedboats![index].overview.substring(0, 12)}",
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12.0, top: 5),
                                  child: Text(
                                    "\$${con1.retrievedboats![index].total_amount}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black_type),
                                  ),
                                ),
                              ],
                            );
                          }),
                    );
                  },
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
