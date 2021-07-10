var one = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliqu';
var two = 'Join motion director Sarah Beth Morgan for a two-part interactive crash course where you will deep dive into the world of character design for animation. You' +'ll gain a comprehensive understanding of Sarah Beth’s process as she walks you through creating a character, from backstory and sketch to complete design. Calling all designers; this is the animation design crash course for you!';
var three = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliqu';
class video{
  String assest;
  String tite;
  String Author;
  String avatar;
  String date;
  String content;

  video(this.assest, this.tite, this.Author, this.avatar, this.date,
      this.content);
}

List<video> v = [
  video('vidoe_1.png',
      'Understanding the Mercedes Benz Motor Power',
      'Maxwell Jonas', 'profile 1.png','July 2, 2021', one),
  video('vidoe_2.png',
      'Character Design for Animation with Sarah Beth Morgan',
      'Sarah Beth', 'profile 2.png','June 30, 2021', two),
  video('vidoe_3.png',
      'Mechanical Learning about Motor and other stuffs',
      'Henskey', 'profile 3.png','June 28, 2021', three)
];