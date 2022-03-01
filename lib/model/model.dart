class YogaModel{
  static String YogaTable1 = "BeginnerYoga";
  static String IDName = "ID";
  static String YogaName = "YogaName";
  static String SecondsOrNot = "SecondsOrNot";
  static String ImageName = "ImageName";
  static List<String>? YogaTable1ColumnName = [YogaModel.IDName,YogaModel.SecondsOrNot,YogaModel.YogaName,YogaModel.ImageName];

}



class Yoga{
  final int? id;
  final bool Seconds;
  final String YogaTitle;
  final String YogaImgUrl;

  const Yoga({
    this.id,
    required this.Seconds,
    required this.YogaImgUrl,
    required this.YogaTitle
});

  Yoga copy({
  int? id,
    bool? Seconds,
    String? YogaTitle,
    String? YogaImgUrl
}){
    return Yoga(
      id: id?? this.id,
        Seconds: Seconds?? this.Seconds,
        YogaImgUrl: YogaImgUrl?? this.YogaImgUrl,
         YogaTitle: YogaTitle?? this.YogaTitle);
  }



  static Yoga fromJson(Map<String, Object?> json){
    return Yoga(
      id: json[YogaModel.IDName] as int?,
        Seconds: json[YogaModel.SecondsOrNot] == 1,
        YogaImgUrl: json[YogaModel.ImageName] as String,
        YogaTitle: json[YogaModel.YogaName] as String);
  }

  Map<String , Object?> toJson(){
    return{
      YogaModel.IDName : id,
      YogaModel.SecondsOrNot: Seconds?1:0,
      YogaModel.YogaName : YogaTitle,
      YogaModel.ImageName : YogaImgUrl,
    };
  }
}