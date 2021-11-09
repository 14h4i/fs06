class Category {
  String? id;
  String? title;

  Category({this.id, this.title});

  Category.formJson(Map<String, dynamic> json) {
    id = json["id"]  ;
    title = json["title"]  ;
  }

  Map<String, dynamic>  toJson() => {
    'id' : id,
    'title' : title
  };
  
}
