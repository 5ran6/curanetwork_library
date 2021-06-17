import 'package:intl/intl.dart';

class Tools {

  String dateUtil(String date) {
    var dateValue =
        new DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(date).toLocal();
    String formattedDate = DateFormat("dd MMM yyyy hh:mm").format(dateValue);
    print("formattedDate = " + formattedDate);
    return formattedDate;
  }

}

