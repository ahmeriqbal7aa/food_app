class DeliveryAddressModel {
  String firstName;
  String lastName;
  String mobileNo;
  String alternateMobileNo;
  String society;
  String street;
  String landMark;
  String city;
  String area;
  String pinCode;
  String addressType;

  DeliveryAddressModel({
    this.addressType,
    this.area,
    this.alternateMobileNo,
    this.city,
    this.firstName,
    this.landMark,
    this.lastName,
    this.mobileNo,
    this.pinCode,
    this.street,
    this.society,
  });
}
