
class ClientModel{

  String clientName;
  String companyName;
  String mobileNumber;
  String email;
  String gstNumber;
  String country;
  String state;
  String city;
  String pincode;
  String address;
  String? gpsLocation;

  ClientModel({

    required this.clientName,
    required this.companyName,
    required this.mobileNumber,
    required this.email,
    required this.gstNumber,
    required this.country,
    required this.state,
    required this.city,
    required this.pincode,
    required this.address,
    this.gpsLocation,

});


}