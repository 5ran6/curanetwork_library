# curanetwork_library

A library for the frontend and backend of the curanetwork mobile apps.

## Getting Started
This project contains the boilerplate code for the Curanet Mobile Apps

## Features:
- Api Helper Class { Backend }
- Utils components { Frontend }

### Api Helper Class:
- Accounts
- Appointments
- wallets
- records


### Flutter Environment:
- Flutter SDK

### Usage
import the curanetwork_library to get access to the boilerplate code

```
    import 'package:curanetwork_library/*   
```
#### Api Helper Class Functions

To use the backend services, import the Apis.dart helper class like this

```
    import 'package:curanetwork_library/services/Apis.dart';
```


- Signup function taking EMAIL, MOBILE NO. AND PASSWORD
- Activate function taking in  TYPE, EMAIL, CODE AND MOBILE NO.
- Login with email function taking EMAIL AND PASSWORD
- Login with phone function taking PHONE AND PASSWORD
- Edit patients function taking  FIRSTNAME,MIDDLE NAME,LASTNAME, DOB,SEX, ADDRESS, CITY, STATE, SELFY, IDtype, IDnumber, IDverified, WEIGHT, HEIGHT, GENOTYPE, MEDICAL DOCUMENTS, EMERGENCY CONTACT,  
-  Edit doctor profile taking in FIRSTNAME,MIDDLE NAME,LASTNAME, DOB,SEX, ADDRESS, CITY, STATE, WEIGHT, HEIGHT, GENOTYPE, MEDICAL DOCUMENTS, EMERGENCY CONTACT,  
-  Send Otp taking in EMAIL and PHONE
-  Verify Otp taking in TYPE, EMAIL,CODE, REFERENCE
-  ID verification taking in TYPE and BVN
-  Get User Account Details { a get request}
-  Forgot Password funtion taking in PHONE NUMBER
-  Logout 
-  Book An Appointment taking in DOCTOR {ID} AND DATETIME
-  Reschedule Appointment taking in  DATETIME
-  Cancel Appointment taking in REASON and MESSAGE
-  View Appointments taking in REASON and MESSAGE
-  Recommended Doctor taking in BODYPART
-  Get Doctor Details {get request}
-  Get Prescription {get request}
-  Wallet Details {get request}
-  Make Deposit taking in TYPE and AMOUNT
-  Make Withdrawal taking in AMOUNT and WITHDRAWAL PIN
-  Add Bank Account BANK, ACCOUNT NAME, ACCOUNT PIN, WITHDRAWAL PIN
-  View Transactions taking in PHONE and PASSWORD
-  Pay With card taking in EMAIL and PASSWORD
-  Pay With Bank Transfer taking in EMAIL and PASSWORD


#### Frontend helper class functions

To use the frontend tools, they are all found in the utils directory. Example, if you want to use the colors utils helper class, import it like this

```
    import 'package:curanetwork_library/utils/values/colors.dart';
```

##### Constants:

  Tools are used by importing from {{base_lib}}/utils/values/
- Borders 
- Colors
- Params
- Radii
- Shadows 
- Values



