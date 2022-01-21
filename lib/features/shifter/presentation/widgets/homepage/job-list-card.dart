import 'package:flutter/material.dart';
import 'package:shifter/features/shifter/presentation/jobdetails/job-detail-page.dart';

class JobListCardWidget extends StatelessWidget {
  const JobListCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(10)),
      child: Container(
        constraints: BoxConstraints(
            minWidth: 200,
            maxWidth: 200,
            minHeight: 250,
            maxHeight: 250),
        padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 10),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.start,
          crossAxisAlignment:
          CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius:
                  BorderRadius.circular(
                      10)),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Job Title".toUpperCase(),
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment:
              MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.apartment_rounded,
                  color: Colors.grey,
                  size: 15,
                ),
                Text(
                  "Company Name",
                  style: TextStyle(
                      fontWeight:
                      FontWeight.w500,
                      fontSize: 10),
                )
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tincidunt id felis sit amet ornare. Fusce blandit, enim sed mattis mattis, elit quam molestie arcu, eu dictum mi erat eu velit. Aliquam consequat placerat turpis non sollicitudin. Nunc eu venenatis lacus. Curabitur felis felis, ultricies a lacus vitae, laoreet mattis metus. Phasellus diam enim, eleifend nec libero malesuada, luctus venenatis lectus. Aenean varius sapien sit amet tortor elementum euismod. Nam pulvinar pharetra sem, vitae blandit neque mattis id. Praesent enim eros, eleifend ut mauris nec, tempor porttitor quam. Donec rhoncus eget lorem pretium lacinia. Duis rutrum iaculis sem, id maximus leo luctus non.",
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 6,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 13),
            ),
            /*Spacer(),*/
            Divider(
              color: Colors.grey,
            ),
            Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(JobDetailPage.Tag);
                },
                color: Colors.black87,
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                        10)),
                child: Row(
                  mainAxisSize:
                  MainAxisSize.min,
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.visibility_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "View Details",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Poppins",
                        fontWeight:
                        FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}