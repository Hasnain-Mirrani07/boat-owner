import 'package:boat_owner/app/languages/localization_controller.dart';
import 'package:boat_owner/app/modeules/booking_boat/upcoming_booking/controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/start_rating.dart';
import '../../../themes/styles/textstyle.dart';

class Ui extends StatefulWidget {
  Ui({
    Key? key,
    this.boatname,
    this.boatprice,
    this.image,
    this.overview,
    this.persons,
    this.total_rating,
  });

  String? image;
  String? boatprice;
  String? boatname;
  String? overview;
  String? persons;
  var total_rating;

  @override
  State<Ui> createState() => _UiState();
}

class _UiState extends State<Ui> {
  final con = Get.put(done_booking());

  @override
  void initState() {
    con.getreview(con.doc_id);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: "${widget.image}",
                        fit: BoxFit.cover,
                        width: 70,
                        height: 70,
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${widget.boatname}",
                            style: AppTextStyles.kPrimaryS5W5,
                          ),
                          Text("\$" + LocalizationController.find.getTranlsatedNumbers("${widget.boatprice}"),
                              style: AppTextStyles.kPrimaryS5W4),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${widget.overview!.substring(0, 12)} ",
                      style: AppTextStyles.kPrimaryS7W4,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StarRating(
                            rating: widget.total_rating == null ? 1 : widget.total_rating,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.person, size: 17, color: Colors.grey),
                              Text(
                                LocalizationController.find.getTranlsatedNumbers("${widget.persons}"),
                                style: AppTextStyles.kPrimaryS7W4,
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}