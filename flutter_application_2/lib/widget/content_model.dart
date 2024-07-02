class unboarding{
   String image;
  String title;
  String description;
  unboarding({required this.image,required this.title,required this.description});
}
List<unboarding> contents = [
  unboarding(image: 'images/screen1.png', title:'Select from our \n best Menu', description: 'Pick your Food from our menu\n         More than 35 times'),
  unboarding(image: 'images/screen2.png', title: 'Easy And Online payment', description: 'You Can Pay Cash on Delivery\n         Or Online Method'),
  unboarding(image: 'images/screen3.png', title: 'Delivery', description: 'Deliver Your Food')
];