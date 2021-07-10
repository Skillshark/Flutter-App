class Jobm{
  String tite;
  String Author;
  String avatar;
  String content;
  String location;
  String cart;
  String date;
  List list;

  Jobm(this.tite, this.Author, this.avatar, this.content, this.location,
      this.cart, this.date, this.list);
}
List<Jobm> jlist = [
  Jobm('Senior UX/UI Designer','img/apple_logo.png',  'img/apple_logo.png',
      'Were looking for a senior UI/UX Designer, at least 4 years of experience with product making knowledge',
      'California, USA', 'Full Time - Remote Friendly', 'Posted 2 days ago', [
      'UX/UI','Product','Designer'
      ]
  ),

  Jobm('Fashion Designer','Levis Clothings',  'img/levis_logo.png',
      'We are looking for a fashion designer with 2 years of experience in fashion technology world',
      'Mumbai, India', 'Full Time', 'Posted 3 days ago', [
        'Fashion','Clothings','Designer'
      ]
  ),
  Jobm('Sound Engineer','Sony Music India',  'img/sony_logo.png',
      'Sound Engineer position needed for 2 years contract and well experienced in sound mixing and good music knowledge to compose and assist',
      'Chennai, India', 'Full Time ', 'Posted 2 days ago', [
        'Sound','Music',
      ]
  ),
  Jobm('Men Fashion Model','Nike',  'img/nike_logo.png',
      'Were looking for a senior UI/UX Designer, at least 4 years of experience with product making knowledge',
      'Mumbai, India', 'Part Time', 'Posted 4 days ago', [
        'Fashion','Clothings','Designer'
      ]
  ),
  Jobm('Senior Experiment Manager','TATA Corporation',  'img/Tata_logo.png',
      'We are looking for a senior experiment manager to conduct experiments',
      'Delhi, India', 'Full Time', 'Posted 4 days ago', [
        'Experiment','TATA','Manager'
      ]
  ),
  Jobm('Automobile Engineer','Tesla Motors',  'img/tesla_logo.png',
      'We are looking for a automobile engineer to kick start their career in Tesla',
      'Bangalore, India', 'Full Time ', 'Posted 5 days ago', [
        'Motors','Tesla','Automobile','car'
      ]
  ),
  Jobm('Electronics and Support Enginee','PK Electronics Pvt. Ltd.',  'img/pk_electrics_logo.png',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
      'Chennai, India', 'Full Time ', 'Posted 6 days ago', [
        'Electronics','Engineering','Support'
      ]
  ),
  Jobm('Professional Photographer','Lenscap Studios',  'img/lenscap_logo.png',
      'We are looking for a professional photographer for wedding and magazine shoots around Mumbai city',
      'Mumbai, India', 'Part Time ', 'Posted 7 days ago', [
        'Photography','Photo','Magazine','Studio'
      ]
  )
];