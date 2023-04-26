class User{
   String name;
   String lastName;
   String imgUrl;
   String email;
   String phone;
   String cell;
   String gender;
   DateTime dob;
   String location;


   User({
     required this.name,
     required this.lastName,
     required this.imgUrl,
     required this.email,
     required this.phone,
     required this.cell,
     required this.gender,
     required this.dob,
     required this.location,
   });

   factory User.fromJson(Map<String, dynamic> json){
     return User(
       name: '${json['name']['first']}',
       lastName: '${json['name']['last']}',
       imgUrl: '${json['picture']['large']}',
       email : json['email'],
       phone : json['phone'],
       cell : json['cell'],
       gender : json['gender'],
       dob : DateTime.parse(json['dob']['date']),
       location : '${json['location']['city']}, ${json['location']['state']}, ${json['location']['country']}',
     );
   }
}