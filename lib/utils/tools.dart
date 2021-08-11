import 'package:intl/intl.dart';

class Tools {
  String dateUtil(String date) {
    var dateValue =
        new DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(date).toLocal();
    String formattedDate = DateFormat("dd MMM yyyy hh:mm").format(dateValue);
    print("formattedDate = " + formattedDate);
    return formattedDate;
  }

  String formatDateToDDMMYYYY(DateTime date) {
    return date.day.toString() +
        "/" +
        date.month.toString() +
        "/" +
        date.year.toString();
  }

  List<String> states = [
    "Abia",
    "Adamawa",
    "Akwa Ibom",
    "Anambra",
    "Bauchi",
    "Bayelsa",
    "Benue",
    "Borno",
    "Cross River",
    "Delta",
    "Ebonyi",
    "Edo",
    "Ekiti",
    "Enugu",
    "FCT - Abuja",
    "Gombe",
    "Imo",
    "Jigawa",
    "Kaduna",
    "Kano",
    "Katsina",
    "Kebbi",
    "Kogi",
    "Kwara",
    "Lagos",
    "Nasarawa",
    "Niger",
    "Ogun",
    "Ondo",
    "Osun",
    "Oyo",
    "Plateau",
    "Rivers",
    "Sokoto",
    "Taraba",
    "Yobe",
    "Zamfara"
  ];

  Map<String, String> banks = {
    "011": "First Bank of Nigeria",
    "057": "Zenith Bank",
    "058": "GTBank Plc",
    "032": "Union Bank",
    "232": "Sterling Bank",
    "033": "United Bank for Africa",
    "044": "Access Bank",
    "035": "WemaBank",
    "084": "Enterprise Bank",
    "063": "Diamond Bank",
    "030": "Heritage",
    "215": "Unity Bank",
    "402": "Jubilee Life Mortgage Bank",
    "082": "Keystone Bank",
    "221": "Stanbic IBTC Bank",
    "315": "GTMobile",
    "070": "Fidelity Bank",
    "050": "Ecobank Plc",
    "307": "EcoMobile",
    "304": "Stanbic Mobile Money",
    "560": "Page MFBank",
    "308": "FortisMobile",
    "328": "TagPay",
    "309": "FBNMobile",
    "326": "Sterling Mobile",
    "990": "Omoluabi Mortgage Bank",
    "311": "ReadyCash Parkway",
    "076": "Skye Bank",
    "068": "Standard Chartered Bank",
    "306": "eTranzact",
    "323": "Access Money",
    "023": "CitiBank",
    "302": "Eartholeum",
    "324": "Hedonmark",
    "325": "MoneyBox",
    "301": "JAIZ Bank",
    "318": "Fidelity Mobile",
    "319": "TeasyMobile",
    "999": "NIP Virtual Bank",
    "320": "VTNetworks",
    "501": "Fortis Microfinance Bank",
    "329": "PayAttitude Online",
    "322": "ZenithMobile",
    "303": "ChamsMobile",
    "403": "SafeTrust Mortgage Bank",
    "551": "Covenant Microfinance Bank",
    "415": "Imperial Homes Mortgage Bank",
    "552": "NPF MicroFinance Bank",
    "526": "Parralex",
    "305": "Paycom",
    "100": "SunTrust Bank",
    "317": "Cellulant",
    "401": "ASO Savings and & Loans",
    "327": "Pagatech",
    "559": "Coronation Merchant Bank",
    "601": "FSDH",
    "313": "Mkudi",
    "214": "First City Monument Bank",
    "314": "FET",
    "523": "Trustbond",
  };
}
