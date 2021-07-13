class SignUpResponseModel {
  String message;
  Data data;

  SignUpResponseModel({this.message, this.data});

  SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  UserData userData;
  int isProfileFullfilled;

  Data({this.userData, this.isProfileFullfilled});

  Data.fromJson(Map<String, dynamic> json) {
    userData = json['data'] != null ? new UserData.fromJson(json['data']) : null;
    isProfileFullfilled = json['is_profile_fullfilled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['data'] = this.userData.toJson();
    }
    data['is_profile_fullfilled'] = this.isProfileFullfilled;
    return data;
  }
}

class UserData {
  int id;
  String name;
  String email;
  Null emailVerifiedAt;
  String emailToken;
  String deviceToken;
  Null deviceType;
  Null role;
  int isAppUser;
  int isThirdPartyUser;
  int isVerified;
  int isActive;
  int isNotification;
  int openfireRegistration;
  int contactId;
  Null jabberId;
  Null registerCode;
  Null registerCodeExpireAt;
  Null registerCodeVerifiedAt;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  ContactDetail contactDetail;

  UserData(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.emailToken,
        this.deviceToken,
        this.deviceType,
        this.role,
        this.isAppUser,
        this.isThirdPartyUser,
        this.isVerified,
        this.isActive,
        this.isNotification,
        this.openfireRegistration,
        this.contactId,
        this.jabberId,
        this.registerCode,
        this.registerCodeExpireAt,
        this.registerCodeVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.contactDetail});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    emailToken = json['email_token'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
    role = json['role'];
    isAppUser = json['is_app_user'];
    isThirdPartyUser = json['is_third_party_user'];
    isVerified = json['is_verified'];
    isActive = json['is_active'];
    isNotification = json['is_notification'];
    openfireRegistration = json['openfire_registration'];
    contactId = json['contact_id'];
    jabberId = json['jabber_id'];
    registerCode = json['register_code'];
    registerCodeExpireAt = json['register_code_expire_at'];
    registerCodeVerifiedAt = json['register_code_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    contactDetail = json['contact_detail'] != null
        ? new ContactDetail.fromJson(json['contact_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['email_token'] = this.emailToken;
    data['device_token'] = this.deviceToken;
    data['device_type'] = this.deviceType;
    data['role'] = this.role;
    data['is_app_user'] = this.isAppUser;
    data['is_third_party_user'] = this.isThirdPartyUser;
    data['is_verified'] = this.isVerified;
    data['is_active'] = this.isActive;
    data['is_notification'] = this.isNotification;
    data['openfire_registration'] = this.openfireRegistration;
    data['contact_id'] = this.contactId;
    data['jabber_id'] = this.jabberId;
    data['register_code'] = this.registerCode;
    data['register_code_expire_at'] = this.registerCodeExpireAt;
    data['register_code_verified_at'] = this.registerCodeVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.contactDetail != null) {
      data['contact_detail'] = this.contactDetail.toJson();
    }
    return data;
  }
}

class ContactDetail {
  int id;
  int categoryId;
  Null officeId;
  Null difficultyLevelId;
  int preferPaymentMethodId;
  Null salutation;
  String firstName;
  Null middleName;
  String lastName;
  String email;
  Null mobile1;
  Null mobile2;
  Null nationality;
  Null designation;
  Null dob;
  Null gender;
  Null profilePic;
  Null colorCode;
  Null skiingLevel;
  Null instructorNumber;
  Null qRNumber;
  Null insuranceNumber;
  int displayInApp;
  int isActive;
  Null subcategoryId;
  Null serviceName;
  Null otherAddress;
  Null contactPersonEmail;
  Null contactPersonName;
  Null joiningDate;
  Null lastBookingDate;
  Null additionComments;
  int totalFeedback;
  String averageRating;
  Null signature;
  Null createdBy;
  Null updatedBy;
  String createdAt;
  String updatedAt;
  Null deletedAt;

  ContactDetail(
      {this.id,
        this.categoryId,
        this.officeId,
        this.difficultyLevelId,
        this.preferPaymentMethodId,
        this.salutation,
        this.firstName,
        this.middleName,
        this.lastName,
        this.email,
        this.mobile1,
        this.mobile2,
        this.nationality,
        this.designation,
        this.dob,
        this.gender,
        this.profilePic,
        this.colorCode,
        this.skiingLevel,
        this.instructorNumber,
        this.qRNumber,
        this.insuranceNumber,
        this.displayInApp,
        this.isActive,
        this.subcategoryId,
        this.serviceName,
        this.otherAddress,
        this.contactPersonEmail,
        this.contactPersonName,
        this.joiningDate,
        this.lastBookingDate,
        this.additionComments,
        this.totalFeedback,
        this.averageRating,
        this.signature,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  ContactDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    officeId = json['office_id'];
    difficultyLevelId = json['difficulty_level_id'];
    preferPaymentMethodId = json['prefer_payment_method_id'];
    salutation = json['salutation'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobile1 = json['mobile1'];
    mobile2 = json['mobile2'];
    nationality = json['nationality'];
    designation = json['designation'];
    dob = json['dob'];
    gender = json['gender'];
    profilePic = json['profile_pic'];
    colorCode = json['color_code'];
    skiingLevel = json['skiing_level'];
    instructorNumber = json['instructor_number'];
    qRNumber = json['QR_number'];
    insuranceNumber = json['insurance_number'];
    displayInApp = json['display_in_app'];
    isActive = json['is_active'];
    subcategoryId = json['subcategory_id'];
    serviceName = json['service_name'];
    otherAddress = json['other_address'];
    contactPersonEmail = json['contact_person_email'];
    contactPersonName = json['contact_person_name'];
    joiningDate = json['joining_date'];
    lastBookingDate = json['last_booking_date'];
    additionComments = json['addition_comments'];
    totalFeedback = json['total_feedback'];
    averageRating = json['average_rating'];
    signature = json['signature'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['office_id'] = this.officeId;
    data['difficulty_level_id'] = this.difficultyLevelId;
    data['prefer_payment_method_id'] = this.preferPaymentMethodId;
    data['salutation'] = this.salutation;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['mobile1'] = this.mobile1;
    data['mobile2'] = this.mobile2;
    data['nationality'] = this.nationality;
    data['designation'] = this.designation;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['profile_pic'] = this.profilePic;
    data['color_code'] = this.colorCode;
    data['skiing_level'] = this.skiingLevel;
    data['instructor_number'] = this.instructorNumber;
    data['QR_number'] = this.qRNumber;
    data['insurance_number'] = this.insuranceNumber;
    data['display_in_app'] = this.displayInApp;
    data['is_active'] = this.isActive;
    data['subcategory_id'] = this.subcategoryId;
    data['service_name'] = this.serviceName;
    data['other_address'] = this.otherAddress;
    data['contact_person_email'] = this.contactPersonEmail;
    data['contact_person_name'] = this.contactPersonName;
    data['joining_date'] = this.joiningDate;
    data['last_booking_date'] = this.lastBookingDate;
    data['addition_comments'] = this.additionComments;
    data['total_feedback'] = this.totalFeedback;
    data['average_rating'] = this.averageRating;
    data['signature'] = this.signature;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
