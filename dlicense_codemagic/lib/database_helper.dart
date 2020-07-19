

import 'dart:convert';
 List countriesdata = [];
    List licenseclassdata=[];
  List licensecodesdata=[];
  List licensetitlesdata=[];
  List licensetypedata=[];
  List statedata=[];

  List apidata = [];
  //String classOptions;
   List classdata = [];
  List<Map<String, dynamic>> planet ;
  List planetX = [];List planetB = [];
  List filteredCountries = [];
  //List planetList = ["planet", "Venus", "Earth"];


  List<Map<String, dynamic>> countriesdatalist=[
  {
    "id": 1,
    "countryName": "AF",
    "countryCode": "Afghanistan",
    "countryPhone": 93
  },
  {
    "id": 2,
    "countryName": "AL",
    "countryCode": "Albania",
    "countryPhone": 355
  },
  {
    "id": 3,
    "countryName": "DZ",
    "countryCode": "Algeria",
    "countryPhone": 213
  },
  {
    "id": 4,
    "countryName": "AS",
    "countryCode": "American Samoa",
    "countryPhone": 1684
  }
];

    int licenceNumber;
     int licenceCodeOptionsid; 
    String _color;
    bool ir = false;
    bool co_Pilot = false;
    bool additionalratingcoPilot=false;
    bool additionalratingIR=false;
    bool loaded=false;

DateTime _dateTime;
    String dt_irtest;
    String licence_Number;
    String countryCodes;
    String _class;
    String tpyeOptionData;
    String classOptions;
    String examinarRemarksandRestrictions;
    String ratingcertificateendorsement;
    String additionalratingtpyeOptionData;
    String instructorremarksandRestrictions;
   
    var contries;
    var licenceCodeOptions;
    var titleOfLicenceOptions;
    var dateofratingtest;
    var dateOfInitialIssue;
    var dateofIRtest;
    var examiners;
    var additionalLicenceNumber;
    var validuntil;
    var examinerscertificatenumber;
    var instructorsOptions;
    var remarksandRestrictions; 
    var addtiionalratingclassOptions;
Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));
String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        this.additionalRemarks,
        this.codeId,
        this.dt_irtest,
        this.dt_issue,
        this.dt_ratingtest,
        this.dt_validity,
        this.examinerCodeId,
        this.examinerNumber,
        this.id,
        this.issuedBy,
        this.licenseDetails,
        this.licenseNumber,
        this.personnel,
        this.ratingCertId,
        this.remarks,
        this.stateId,
        this.titleId,
    });
  String additionalRemarks;
  int codeId;
  String dt_irtest;
  String dt_issue;
  String dt_ratingtest;
  String dt_validity;
  int examinerCodeId;
  int examinerNumber;
  int id;
  int issuedBy;
  List<LicenseDetail> licenseDetails;
  int licenseNumber;
  List<Personnel> personnel;
  String ratingCertId;
  String remarks;
  int stateId;
  int titleId;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        additionalRemarks: json["additionalRemarks"] == null ? null : json["additionalRemarks"],
        codeId: json["codeId"] == null ? null : json["codeId"],
        dt_irtest: json["dt_irtest"] == null ? null : json["dt_irtest"],
        dt_issue: json["dt_issue"] == null ? null : json["dt_issue"],
        dt_ratingtest: json["dt_ratingtest"] == null ? null : json["dt_ratingtest"],
        dt_validity: json["dt_validity"] == null ? null : json["dt_validity"],
        examinerCodeId: json["examinerCodeId"] == null ? null : json["examinerCodeId"],
        examinerNumber: json["examinerNumber"] == null ? null : json["examinerNumber"],
        id: json["id"] == null ? null : json["id"],
        issuedBy: json["issuedBy"] == null ? null : json["issuedBy"],
        licenseDetails: json["licenseDetails"] == null ? null : List<LicenseDetail>.from(json["licenseDetails"].map((x) => LicenseDetail.fromJson(x))),
        licenseNumber: json["licenseNumber"] == null ? null : json["licenseNumber"],
        personnel: json["personnel"] == null ? null : List<Personnel>.from(json["personnel"].map((x) => Personnel.fromJson(x))),
        ratingCertId: json["ratingCertId"] == null ? null : json["ratingCertId"],
        remarks: json["remarks"] == null ? null : json["remarks"],
        stateId: json["stateId"] == null ? null : json["stateId"],
        titleId: json["titleId"] == null ? null : json["titleId"],
    );

    Map<String, dynamic> toJson() => {
        "additionalRemarks": additionalRemarks == null ? null : additionalRemarks,
        "codeId": codeId == null ? null : codeId,
        "dt_irtest": dt_irtest == null ? null : dt_irtest,
        "dt_issue": dt_issue == null ? null : dt_issue,
        "dt_ratingtest": dt_ratingtest == null ? null : dt_ratingtest,
        "dt_validity": dt_validity == null ? null : dt_validity,
        "examinerCodeId": examinerCodeId == null ? null : examinerCodeId,
        "examinerNumber": examinerNumber == null ? null : examinerNumber,
        "id": id == null ? null : id,
        "issuedBy": issuedBy == null ? null : issuedBy,
        "licenseDetails": licenseDetails == null ? null : List<dynamic>.from(licenseDetails.map((x) => x.toJson())),
        "licenseNumber": licenseNumber == null ? null : licenseNumber,
        "personnel": personnel == null ? null : List<dynamic>.from(personnel.map((x) => x.toJson())),
        "ratingCertId": ratingCertId == null ? null : ratingCertId,
        "remarks": remarks == null ? null : remarks,
        "stateId": stateId == null ? null : stateId,
        "titleId": titleId == null ? null : titleId,
    };
}

class LicenseDetail {
    LicenseDetail({
        this.additionalRating,
        this.classId,
        this.copilot,
        this.id,
        this.ir,
        this.typeId,
    });

    bool additionalRating;
    int  classId;
    bool copilot;
    int  id;
    bool ir;
    int  typeId;

    factory LicenseDetail.fromJson(Map<String, dynamic> json) => LicenseDetail(
        additionalRating: json["additionalRating"] == null ? null : json["additionalRating"],
        classId: json["classId"] == null ? null : json["classId"],
        copilot: json["copilot"] == null ? null : json["copilot"],
        id: json["id"] == null ? null : json["id"],
        ir: json["ir"] == null ? null : json["ir"],
        typeId: json["typeId"] == null ? null : json["typeId"],
    );

    Map<String, dynamic> toJson() => {
        "additionalRating": additionalRating == null ? null : additionalRating,
        "classId": classId == null ? null : classId,
        "copilot": copilot == null ? null : copilot,
        "id": id == null ? null : id,
        "ir": ir == null ? null : ir,
        "typeId": typeId == null ? null : typeId,
    };
}

class Personnel {
    Personnel({
        this.id,
        this.idUser,
        this.personnelType,
        this.remarks,
    });

    int id;
    String idUser;
    String personnelType;
    String remarks;

    factory Personnel.fromJson(Map<String, dynamic> json) => Personnel(
        id: json["id"] == null ? null : json["id"],
        idUser: json["idUser"] == null ? null : json["idUser"],
        personnelType: json["personnelType"] == null ? null : json["personnelType"],
        remarks: json["remarks"] == null ? null : json["remarks"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "idUser": idUser == null ? null : idUser,
        "personnelType": personnelType == null ? null : personnelType,
        "remarks": remarks == null ? null : remarks,
    };
}





void shoe(
 Welcome saveLicenseData,
 LicenseDetail licenseDetail,
 Personnel personal){
 saveLicenseData.personnel = <Personnel>[personal];
 saveLicenseData.licenseDetails = <LicenseDetail>[licenseDetail];
 String jsons = welcomeToJson(saveLicenseData);
 print( jsons);
}