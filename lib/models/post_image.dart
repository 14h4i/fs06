


class PostImage{
  String? id;
  String? url;
  int? orgWidth;
  int? orgHeight;
  String? orgUrl;
  String? cloudName;
  String? dominatColor;
  int? fileSize;

  PostImage({this.id, this.url, this.orgWidth, this.orgHeight, this.orgUrl, this.cloudName, this.dominatColor, this.fileSize});

  PostImage.fromJson(Map<String, dynamic> json){
    id = json["id"]  ;
    url = json["url"]  ;
    orgHeight = json["orgHeight"]  ;
    orgWidth = json["orgWidth"]  ;
    orgUrl = json["orgUrl"]  ;
    cloudName = json["cloudName"]  ;
    dominatColor = json["dominatColor"]  ;
    fileSize = json["fileSize"]  ;
  }

  Map<String, dynamic> toJson() => {
    "orgHeight": orgHeight,
    "orgWidth": orgWidth,
    "id":id,
    "orgUrl": orgUrl,
    "cloudName": cloudName,
    "dominatColor": dominatColor,
    "fileSize": fileSize,
  };

}