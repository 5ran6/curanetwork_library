import 'package:curanetwork_library/imports/imports.dart';
import 'package:curanetwork_library/utils/tools.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Apis {
  bool debug = true;
  Tools tools = new Tools();
  late SharedPreferences prefs;

  final String? iAmA; /// enum ["consultant" or "patient"]

  Apis (this.iAmA);

  //#-----Accounts-------------------------------------------------------------------------------------------------

//create user
  Future<Map?> signUp(String email, String mobile, String password) async {
    Map data = {'email': email, 'mobile': mobile, 'password': password};
    prefs = await SharedPreferences.getInstance();

    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;

    /*Calling the API url */
    var jsonData;
    final response = await http.post(
        Uri.parse(Params.base_url + "/accounts/auth/users/"),
        body: data,
        headers: {"Client-ID": "$client_id"});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);

      prefs.setString('email', jsonData["email"]);
      prefs.setString('mobile', jsonData["mobile"]);
      prefs.setString('referralCode', jsonData["referralCode"]);
      prefs.setString('username', jsonData["username"]);
      prefs.setInt('id', jsonData["id"]);

      return {
        "email": jsonData["email"],
        "mobile": jsonData["mobile"],
        "referralCode": jsonData["referralCode"],
        "username": jsonData["username"],
        "id": jsonData["id"]
      };
    } else if (response.statusCode == 400){
      return {
        "error": jsonData["password"],
      };
    }else {
      if (debug) print("Error Requesting API");
      return null;
    }
  }

//activate account
  Future<String?> activateAccount(
      String type, String email, String mobile, String code) async {
    Map data = {'type': type, 'email': email, 'mobile': mobile, 'code': code};
    prefs = await SharedPreferences.getInstance();

    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;

    /*Calling the API url */
    var jsonData;
    final response = await http.post(
        Uri.parse(Params.base_url + "/accounts/otp/verify"),
        body: data,
        headers: {"Client-ID": "$client_id"});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);

      String message = jsonData["message"];
      return message;
    } else {
      if (debug) print("Error Requesting API");
      return null;
    }
  }

  //login with email
  Future<Map?> loginEmail(String email, String password) async {
    Map data = {'username': email, 'password': password};
    prefs = await SharedPreferences.getInstance();
    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;

    /*Calling the API url */
    var jsonData;
    final response = await http.post(
        Uri.parse(Params.base_url + "/accounts/auth/jwt/create/"),
        body: data,
        headers: {"Client-ID": "$client_id"});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);

      prefs.setBool('loggedIn', true);
      prefs.setString('refresh_token', jsonData["refresh"]);
      prefs.setString('token', jsonData["access_token"]);

      return {
        "refresh_token": jsonData["refresh"],
        "token": jsonData["access_token"],
      };
    } else {
      if (debug) print("Error Requesting API");
      return null;
    }
  }

  //login with phone
  Future<Map?> loginPhone(String phone, String password) async {
    Map data = {'username': phone, 'password': password};
    prefs = await SharedPreferences.getInstance();
    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;

    /*Calling the API url */
    var jsonData;
    final response = await http.post(
        Uri.parse(Params.base_url + "/accounts/auth/jwt/create/"),
        body: data,
        headers: {"Client-ID": "$client_id"});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);

      prefs.setBool('loggedIn', true);
      prefs.setString('refresh_token', jsonData["refresh"]);
      prefs.setString('token', jsonData["access_token"]);

      return {
        "refresh_token": jsonData["refresh"],
        "token": jsonData["access_token"],
      };
    } else {
      if (debug) print("Error Requesting API");
      return null;
    }
  }

//edit patients profile
  Future<String?> editPatientProfile(Map details) async {
    /// values expected (as spelt) in details map are [ "firstName": "Immanuel", "middleName": "", "lastName": "Kolapo", "dateOfBirth": null, "sex": "Male", "address": "", "city": "", "state": "", "selfie": null, "identityType": "", "identityNumber": "", "identityVerified": false, "weight": null, "height": null, "genotype": "", "medicalDocuments": null, "emergencyContacts": null, ]
    prefs = await SharedPreferences.getInstance();
    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;
    String? token = prefs.getString("token");

    Map data = details;
    /*Calling the API url */
    var jsonData;
    final response = await http.patch(
        Uri.parse(Params.base_url + "/accounts/patient/profile"),
        body: data,
        headers: {"Client-ID": "$client_id", "Authorization": "$token"});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);
      return jsonData["message"];
    } else {
      if (debug) print("Error Requesting API");
      return null;
    }
  }

//edit patients profile
  Future<String?> editDoctorProfile(Map details) async {
    /// values expected (as spelt) in details map are [ "firstName": "Immanuel", "middleName": "", "lastName": "Kolapo", "dateOfBirth": null, "sex": "Male", "address": "", "city": "", "state": "", "selfie": null, "identityType": "", "identityNumber": "", "identityVerified": false, "weight": null, "height": null, "genotype": "", "medicalDocuments": null, "emergencyContacts": null, ]
    prefs = await SharedPreferences.getInstance();
    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;
    String? token = prefs.getString("token");

    Map data = details;
    /*Calling the API url */
    var jsonData;
    final response = await http.patch(
        Uri.parse(Params.base_url + "/accounts/doctor/profile"),
        body: data,
        headers: {"Client-ID": "$client_id", "Authorization": "$token"});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);
      return jsonData["message"];
    } else {
      if (debug) print("Error Requesting API");
      return null;
    }
  }

  //send otp
  Future<Map?> sendOtp(String email, String phone) async {
    Map data = {'email': email, 'mobile': phone};
    prefs = await SharedPreferences.getInstance();
    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;

    /*Calling the API url */
    var jsonData;
    final response = await http.post(
        Uri.parse(Params.base_url + "/accounts/otp/send"),
        body: data,
        headers: {"Client-ID": "$client_id"});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);

      return {
        "status": jsonData["status"],
        "reference": jsonData["reference"],
        "hasExpired": jsonData["hasExpired"],
        "expires": tools.dateUtil(jsonData["expires"].toString()),
        "message": jsonData["message"]
      };
    } else {
      if (debug) print("Error Requesting API");
      return null;
    }
  }

  //verify otp
  Future<String?> verifyOtp(
      String type, String email, String code, String reference) async {
    Map data = {
      'type': type,
      'email': email,
      'code': code,
      'reference': reference
    };

    prefs = await SharedPreferences.getInstance();
    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;

    /*Calling the API url */
    var jsonData;
    final response = await http.post(
        Uri.parse(Params.base_url + "/accounts/otp/verify"),
        body: data,
        headers: {"Client-ID": "$client_id"});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);
      return jsonData["message"];
    } else {
      if (debug) print("Error Requesting API");
      return null;
    }
  }

  //identity verification
  Future<Map?> identityVerification(String id_type, String bvn) async {
    /// [id_type] e.g bvn
    Map data = {'id_type': id_type, 'id_number': bvn};
    prefs = await SharedPreferences.getInstance();
    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;

    /*Calling the API url */
    var jsonData;
    final response = await http.post(
        Uri.parse(Params.base_url + "/accounts/identity/verify"),
        body: data,
        headers: {"Client-ID": "$client_id"});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);
      return {
        "id": jsonData["id"],
        "firstName": jsonData["firstName"],
        "lastName": jsonData["lastName"],
        "middleName": jsonData["middleName"],
        "dateOfBirth": jsonData["dateOfBirth"],
        "phoneNumber": jsonData["phoneNumber"],
        "otp": jsonData["otp"],
        "image": jsonData["image"],
        "isFirstNameMatch": jsonData["isFirstNameMatch"],
        "isLastNameMatch": jsonData["isLastNameMatch"],
        "isMiddleNameMatch": jsonData["isMiddleNameMatch"],
        "isDateOfBirthMatch": jsonData["isDateOfBirthMatch"],
        "isPhoneNumberMatch": jsonData["isPhoneNumberMatch"],
        "verificationRef": jsonData["verificationRef"]
      };
    } else {
      if (debug) print("Error Requesting API");
      return null;
    }
  }

  //get user account details
  Future<Map?> getUserAccountDetails() async {
    /// [id_type] e.g bvn

    prefs = await SharedPreferences.getInstance();
    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;
    String? token = prefs.getString("token");

    /*Calling the API url */
    var jsonData;
    final response = await http.get(
        Uri.parse(Params.base_url + "/accounts/auth/users/me/"),
        headers: {"Client-ID": "$client_id", "Authorization": "$token"});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);
      return {
        "id": jsonData["id"],
        "email": jsonData["email"],
        "mobile": jsonData["mobile"],
        "type": jsonData["type"],
        "isActive": jsonData["isActive"],
        "lastLogin": tools.dateUtil(jsonData["lastLogin"].toString()),
        "mesibo": jsonData["mesibo"],
        "doctor": jsonData["doctor"],
        "patient": jsonData["patient"]
      };
    } else {
      if (debug) print("Error Requesting API");
      return null;
    }
  }

//TODO: forgot password
  Future<Map?> forgotPassword(String phoneNumber) async {
    return null;
  }

// logout
  Future<bool?> logout() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.clear().then((value) {
      return value;
    });
  }

//#-----Appointments-------------------------------------------------------------------------------------------------
  //-------Book An Appointment--------------------------------------------------
  Future<Map?> bookAppointment(int doctor, String dateTime) async {
    Map data = {'doctor': doctor, 'dateTime': dateTime};

    ///date format [dateTime] is 2021-04-22 06:00:00

    prefs = await SharedPreferences.getInstance();
    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;
    String? token = prefs.getString("token");

    /*Calling the API url */
    var jsonData;
    final response = await http.post(
        Uri.parse(Params.base_url + "/appointments/"),
        body: data,
        headers: {"Client-ID": "$client_id", "Authorization": "$token"});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);

      return {
        'id': jsonData["id"],
        'doctor': jsonData["doctor"],
        'patient': jsonData["patient"],
        'dateTime': Tools().dateUtil(jsonData["dateTime"]),
        'status': jsonData["status"]
      };
    } else {
      if (debug) print("Error Requesting API");
      return null;
    }
  }

  //-------Reschedule Appointment-----------------------------------------------
  Future<String?> rescheduleAppointment(String dateTime) async {
    ///date format [dateTime] is 2021-04-22 06:00:00

    Map data = {"dateTime": dateTime};
    prefs = await SharedPreferences.getInstance();
    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;
    String? token = prefs.getString("token");

    /*Calling the API url */
    var jsonData;
    final response = await http.post(
        Uri.parse(Params.base_url + "/appointments/2/reschedule/"),
        body: data,
        headers: {"Client-ID": "$client_id", "Authorization": "$token"});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);
      prefs.setString('dateTime', Tools().dateUtil(jsonData["dateTime"]));
      String message = jsonData['message'];

      return message;
    }
    // if dateTime in the past
    else if (response.statusCode == 400) {
      String message = jsonData['dateTime'].toString();
      return message;
    } else {
      if (debug) print("Error Requesting API");
      print("error code");
    }
  }

  //-------Cancel Appointment---------------------------------------------------
  //TODO: handle response body
  Future<bool?> cancelAppointment(String reason, String message) async {
    Map data = {"reason": reason, "message": message};
    prefs = await SharedPreferences.getInstance();
    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;
    String? token = prefs.getString("token");

    /*Calling the API url */
    var jsonData;
    final response = await http.post(
        Uri.parse(Params.base_url + "/appointments/2/cancel/"),
        body: data,
        headers: {"Client-ID": "$client_id", "Authorization": "$token"});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);

      return true;
    } else {
      if (debug) print("Error Requesting API");
      return false;
    }
  }

  //------View Appointments-----------------------------------------------------
  //TODO: handle response body
  Future<bool?> viewAppointment(String reason, String message) async {
    Map data = {"reason": reason, "message": message};
    prefs = await SharedPreferences.getInstance();
    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;
    String? token = prefs.getString("token");

    /*Calling the API url */
    var jsonData;
    final response = await http.get(
        Uri.parse(Params.base_url + "/appointments/"),
        headers: {"Client-ID": "$client_id", "Authorization": "$token"});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);

      return true;
    } else {
      if (debug) print("Error Requesting API");
      return false;
    }
  }

  //------Recommended Doctor----------------------------------------------------
  Future<Map?> recommendedDoctor(String bodyPart) async {
    Map data = {"q": bodyPart};
    prefs = await SharedPreferences.getInstance();
    String? client_id = prefs.getString("Client-ID");
    String? token = prefs.getString("token");

    /*Calling the API url */
    var jsonData;
    final response = await http.get(
        Uri.parse(Params.base_url + "/appointments/doctors/search"),
        headers: {"Client-ID": "$client_id", "Authorization": '$token'});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);
      return jsonData['results'][0];
    } else {
      if (debug) print("Error Requesting API");
      return null;
    }
  }

  //-----Get Doctor Details-----------------------------------------------------
  //TODO: handle response body
  Future<Map?> getDoctorDetails() async {
    prefs = await SharedPreferences.getInstance();
    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;
    String? token = prefs.getString("token");

    /*Calling the API url */
    var jsonData;
    final response = await http.get(
        Uri.parse(Params.base_url + "/appointments/doctors/3"),
        headers: {"Client-ID": "$client_id", "Authorization": '$token'});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);
      Map data = jsonData['results'][0];

      return data;
    } else {
      if (debug) print("Error Requesting API");
      return null;
    }
  }

//#-----Records-------------------------------------------------------------------------------------------------
  //#-------------createPrescription----------------------------------------------------------------------------
  Future<Map?> createPrescription(
      int patient,
      int drug,
      String drug_form,
      int dose,
      int strength,
      String unit,
      String period,
      String length,
      String frequency,
      String route,
      String additional_note) async {
    ///date format [dateTime] is 2021-04-22 06:00:00

    Map data = {
      "patient": patient,
      "drug": drug,
      "drug_form": drug_form,
      "dose": dose,
      "strength": strength,
      "unit": unit,
      "period": period,
      "length": length,
      "frequency": frequency,
      "route": route,
      "additional_note": additional_note
    };
    prefs = await SharedPreferences.getInstance();
    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;
    String? token = prefs.getString("token");

    /*Calling the API url */
    var jsonData;
    final response = await http.post(
        Uri.parse(Params.base_url + "/records/prescriptions/"),
        body: data,
        headers: {"Client-ID": "$client_id", "Authorization": "$token"});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);

      return {
        "id": jsonData["id"],
        "created": tools.dateUtil(jsonData["created"]),
        "modified": tools.dateUtil(jsonData["modified"]),
        "drugForm": jsonData["drugForm"],
        "dose": jsonData["dose"],
        "strength": jsonData["strength"],
        "unit": jsonData["unit"],
        "period": jsonData["period"],
        "length": jsonData["length"],
        "frequency": jsonData["frequency"],
        "route": jsonData["route"],
        "additionalNote": jsonData["additionalNote"],
        "patient": jsonData["patient"],
        "drug": jsonData["drug"]
      };
    }
    // if dateTime in the past
    else {
      if (debug) print("Error Requesting API");
    }
  }

  //#-------------getPrescription----------------------------------------------------------------------------
  Future<Map?> getPrescription() async {
    prefs = await SharedPreferences.getInstance();
    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;
    String? token = prefs.getString("token");

    /*Calling the API url */
    var jsonData;
    final response = await http.get(
        Uri.parse(Params.base_url + "/records/prescriptions/"),
        headers: {"Client-ID": "$client_id", "Authorization": "$token"});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);

      return {
        "id": jsonData["id"],
        "duration": jsonData["duration"],
        "drugStrength": jsonData["drugStrength"],
        "summary": jsonData["summary"],
        "created": tools.dateUtil(jsonData["created"]),
        "modified": tools.dateUtil(jsonData["modified"]),
        "drugForm": jsonData["drugForm"],
        "dose": jsonData["dose"],
        "strength": jsonData["strength"],
        "unit": jsonData["unit"],
        "period": jsonData["period"],
        "length": jsonData["length"],
        "frequency": jsonData["frequency"],
        "route": jsonData["route"],
        "additionalNote": jsonData["additionalNote"],
        "patient": jsonData["patient"],
        "drug": jsonData["drug"],
        "prescribedBy": jsonData["prescribedBy"]
      };
    } else {
      if (debug) print("Error Requesting API");
      return null;
    }
  }

//#-----Wallets-------------------------------------------------------------------------------------------------

  //=============================================WALLET DETAILS======================================================
  Future<Map?> walletDetails() async {
    prefs = await SharedPreferences.getInstance();
    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;
    String? token = prefs.getString("token");

    /*Calling the API url */
    var jsonData;
    final response = await http.get(Uri.parse(Params.base_url + "/wallets/"),
        headers: {"Client-ID": "$client_id", "Authorization": "$token"});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);

      return {
        "id": jsonData["data"]["id"],
        "currency": jsonData["data"]["currency"],
        "unspendable": jsonData["data"]["unspendable"],
        "availableBalance": jsonData["data"]["availableBalance"],
        "user": jsonData["data"]["user"],
      };
    } else {
      if (debug) print("Error Requesting API");
      return null;
    }
  }

  //=========================================MAKE DEPOSIT===========================================================
  Future<Map?> makeDeposit(String type, String amount) async {
    Map data = {'type': type, 'amount': amount};
    prefs = await SharedPreferences.getInstance();
    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;
    String? token = prefs.getString("token");

    /*Calling the API url */
    var jsonData;
    final response = await http.post(
        Uri.parse(Params.base_url + "/wallets/deposit"),
        body: data,
        headers: {"Client-ID": "$client_id", "Authorization": "$token"});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }
    jsonData = json.decode(response.body);
    //response::Unprocessable entity
    if (response.statusCode == 422) {
      return {"status": jsonData["status"], "message": jsonData["message"]};
    }
    //response::Forbidden
    else if (response.statusCode == 403) {
      return {"detail": jsonData["detail"]};
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    else if (response.statusCode == 200 || response.statusCode == 201) {
      return {
        "responseCode": jsonData["data"]["data"]["responseCode"],
        "responseMessage": jsonData["data"]["data"]["responseMessage"],
        "orderRef": jsonData["data"]["data"]["orderRef"],
        "accountNumber": jsonData["data"]["data"]["accountNumber"],
        "bankName": jsonData["data"]["data"]["bankName"],
        "amount": jsonData["data"]["data"]["amount"],
        "txRef": jsonData["data"]["data"]["txRef"]
      };
    }
  }

  //=================================================MAKE WITHDRAWAL===================================================
  Future<Map?> makeWithdrawal(String amount, String withdrawalPin) async {
    Map data = {'amount': amount, 'withdrawal_pin': withdrawalPin};
    prefs = await SharedPreferences.getInstance();
    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;
    String? token = prefs.getString("token");

    /*Calling the API url */
    var jsonData;
    final response = await http.post(
        Uri.parse(Params.base_url + "/wallets/withdraw"),
        body: data,
        headers: {"Client-ID": "$client_id", "Authorization": "$token"});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }
    jsonData = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return {"status": jsonData["status"], "message": jsonData["message"]};
    }
    //response::Unprocessable entity
    if (response.statusCode == 422) {
      prefs.setString('status', jsonData["status"]);
      prefs.setString('message', jsonData["message"]);

      return {"status": jsonData["status"], "message": jsonData["message"]};
    }
    //response::Forbidden
    else if (response.statusCode == 403) {
      prefs.setString('detail', jsonData["detail"]);

      return {"detail": jsonData["detail"]};
    }
  }

  //================================================ADD BANK ACCOUNT================================================
  Future<Map?> addBankAccount(String bank, String accountName,
      String accountNumber, String withdrawalPin) async {
    Map data = {
      'bank': bank,
      'account_name': accountName,
      'account_number': accountNumber,
      'withdrawal_pin': withdrawalPin
    };

    /*Calling the API url */
    var jsonData;
    final response = await http.post(
        Uri.parse(Params.base_url + "/wallets/bank-account/add"),
        body: data);

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }
    jsonData = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return {
        "status": jsonData["status"],
        "message": jsonData["message"],
        "data": jsonData["data"]
      };
    } else {
      if (debug) print("Error Requesting API");
      return null;
    }
  }

  //==============================================VIEW TRANSACTIONS==============================================
  Future<Map?> viewTransactions(String phone, String password) async {
    prefs = await SharedPreferences.getInstance();
    String? client_id = iAmA == "consultant"? Params.consultant_client_id: Params.patient_client_id;
    String? token = prefs.getString("token");

    /*Calling the API url */
    var jsonData;
    final response = await http.get(
        Uri.parse(Params.base_url + "/wallets/transactions"),
        headers: {"Authorization": 'Token $token', "Client-ID": '$client_id'});

    if (debug) {
      print('Status Code = ' +
          response.statusCode.toString() +
          ". Response: " +
          response.body);
    }

    /*If the response is 200 or 201 (success) then the response will be decoded */
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);

      return {
        "id": jsonData["results"][0]["refresh"],
        "created": tools.dateUtil(jsonData["results"][0]["created"]),
        "modified": tools.dateUtil(jsonData["results"][0]["modified"]),
        "currency": jsonData["results"][0]["currency"],
        "amount": jsonData["results"][0]["amount"],
        "status": jsonData["results"][0]["status"],
        "user": jsonData["results"][0]["user"],
      };
    } else {
      if (debug) print("Error Requesting API");
      return null;
    }
  }

//payWith card
  Future<Map?> payWithCard(String email, String password) async {
    return null;
  }

//payWith Bank Transfer
  Future<Map?> payTransfer(String email, String password) async {
    return null;
  }
}
