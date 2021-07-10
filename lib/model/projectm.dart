class Mproject{
  String assest;
  String tite;
  String Author;
  String avatar;
  List list;
  int like;
  int comment;
  bool islike;
  bool isvideo;

  Mproject(this.assest, this.tite, this.Author, this.avatar, this.list,
      this.like, this.comment,this.islike,this.isvideo);
  
}
List<Mproject> p =[
  Mproject('assets/vidoe_3.png', 'Falcon Project with various alloys',
      'John Wick', 'assets/profile 6.png', ['Robotics','Electric'], 100, 20,false,false),
  Mproject('assets/vidoe_3.png', 'Falcon Project with various alloys',
      'John Wick', 'assets/profile 6.png', ['Robotics','Electric'], 100, 20,true,false),
  Mproject('assets/vidoe_3.png', 'Falcon Project with various alloys',
      'John Wick', 'assets/profile 6.png', ['Robotics','Electric'], 100, 20,false,false),
  Mproject('assets/vidoe_3.png', 'Falcon Project with various alloys',
      'John Wick', 'assets/profile 6.png', ['Robotics','Electric'], 100, 20,true,true),
  Mproject('assets/vidoe_3.png', 'Falcon Project with various alloys',
      'John Wick', 'assets/profile 6.png', ['Robotics','Electric'], 500, 20,false,false),
  Mproject('assets/vidoe_3.png', 'Falcon Project with various alloys',
      'John Wick', 'assets/profile 6.png', ['Robotics','Electric'], 10, 20,false,false),
  Mproject('assets/vidoe_3.png', 'Falcon Project with various alloys',
      'John Wick', 'assets/profile 6.png', ['Robotics','Electric'], 100, 20,true,true),
  Mproject('assets/vidoe_3.png', 'Falcon Project with various alloys',
      'John Wick', 'assets/profile 6.png', ['Robotics','Electric'], 100, 20,false,true),
];