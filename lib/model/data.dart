class RowData{
  String? fname;
  String? lname;
  String? contect;
  String? city;
  String? gender;
  String? date;


  RowData({this.fname,this.lname,this.contect,this.city,this.date,this.gender});
  factory RowData.fromJson(Map<String, dynamic >data){
    return RowData(
      fname :data['Fname'],
      lname :data['Lname'],
      contect :data['ContectNumber'],
      city :data['City'],
      gender :data['Gender'],
      date :data['Date']  
    );  
  }
}