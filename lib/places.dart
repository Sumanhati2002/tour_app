/*
// Sample data for destinations
final List<Map<String, String>> destinations = [
  {
    'title': 'Chhattisgarh',
    'imageUrl': 'https://www.tatacapital.com/blog/wp-content/uploads/2024/05/may-3.jpg',
  },
  {
    'title': 'Karnataka',
    'imageUrl': 'https://hblimg.mmtcdn.com/content/hubble/img/dest_img/mmt/activities/m_Bangalore_dest_landscape_l_869_1229.jpg',
  },
  {
    'title': 'Haryana',
    'imageUrl': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/64/0c/84/serene.jpg?w=1200&h=-1&s=1',
  },
  {
    'title': 'Rajasthan',
    'imageUrl': 'https://www.ranthamborenationalpark.com/blog/wp-content/uploads/2024/01/Best-Places-to-Visit-in-Rajasthan-India.jpg',
  },
  {
    'title': 'Odisha',
    'imageUrl': 'https://www.holidify.com/images/bgImages/KONARK.jpg',
  },
  {
    'title': 'Andhra Pradesh',
    'imageUrl': 'https://4.bp.blogspot.com/-7A8yyNn7o8U/VKZovO3SZlI/AAAAAAAAGm8/H-NcZeZInGA/s1600/Charminar-Hyderabad.jpg',
  },
  {
    'title': 'Gujarat',
    'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUWtQgHg7GI3Cq2Sttmm9HmWN1cEAr6X8tjQ&s',
  },
  {
    'title': 'Himachal Pradesh',
    'imageUrl': 'https://assets-news.housing.com/news/wp-content/uploads/2022/07/28101551/Top-10-tourist-places-to-visit-in-Himachal-Pradesh.jpg',
  },
  {
    'title': 'Kerala',
    'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJj__5FhigmsOiSOt0TpWvfO1THnUXX0X65g&s',
  },
  {
    'title': 'Uttarakhand',
    'imageUrl': 'https://www.holytreetravel.com/blog/IMAGE/Yamunotri.jpg',
  },
  {
    'title': 'Delhi',
    'imageUrl': 'https://static.toiimg.com/photo/46382359/.jpg',
  },
  {
    'title': 'Tripura',
    'imageUrl': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/5c/de/4a/img-20171031-120412306.jpg?w=500&h=400&s=1',
  },
  {
    'title': 'Manipur',
    'imageUrl': 'https://travelfromindia.com/assets/uploads/news-115.jpg',
  },
  {
    'title': 'Arunachal Pradesh',
    'imageUrl': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/01/85/2c/41/jung-falls.jpg?w=1200&h=700&s=1',
  },
  {
    'title': 'Uttar Pradesh',
    'imageUrl': 'https://hblimg.mmtcdn.com/content/hubble/img/destimg/mmt/activities/m_Agra_destjulimg_1_l_830_1277.jpg',
  },
  {
    'title': 'Nagaland',
    'imageUrl': 'https://clubmahindra.gumlet.io/blog/images/Kohima-resized.jpg?w=376&dpr=2.6',
  },
  {
    'title': 'Tamil Nadu',
    'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREJr1mvoKSjZbQK7C3jGQW9z904PX4IUzFcg&s',
  },
  {
    'title': 'Goa',
    'imageUrl': 'https://images.travelandleisureasia.com/wp-content/uploads/sites/3/2024/04/15151106/palm-beach-1-1600x900.jpeg',
  },
  {
    'title': 'Maharashtra',
    'imageUrl': 'https://media2.thrillophilia.com/images/photos/000/152/587/original/1603951915_shutterstock_1242281908.jpg?w=753&h=450&dpr=1.5',
  },
  {
    'title': 'Bihar',
    'imageUrl': 'https://www.india.com/wp-content/uploads/2021/03/Bihar-feature-image-Travel-Place-India-1200.jpg',
  },
  {
    'title': 'Punjab',
    'imageUrl': 'https://plus.unsplash.com/premium_photo-1697730324062-c012bc98eb13?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  },
  {
    'title': 'West Bengal',
    'imageUrl': 'https://www.holidify.com/images/tooltipImages/WEST-BENGAL.jpg',
  },
  {
    'title': 'Mizoram',
    'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_CEhwvcr1JkxJ0DTf6wvTOQwMsny1fpdVRg&s',
  },
  {
    'title': 'Madhya Pradesh',
    'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcbh9ZapFKY9P2lTu3CXEvxBZAvq2uK9bKXQ&s',
  },
  {
    'title': 'Jharkhand',
    'imageUrl': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/06/c3/cc/4c/dassam-falls.jpg?w=600&h=500&s=1',
  },
  {
    'title': 'Sikkim',
    'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgjUjl0jOQhCsH3GYX9e8WsN6_F3BkjhJwDA&s',
  },
  {
    'title': 'Assam',
    'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdoCLz-fzaOI3-67iicvFNl1AXj-ivYnTgpA&s',
  },
  {
    'title': 'Meghalaya',
    'imageUrl': 'https://hblimg.mmtcdn.com/content/hubble/img/cherrapunji/mmt/destination/m_destination-cherrapunji-landscape_l_400_640.jpg',
  },
  {
    'title': 'Telangana',
    'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBTW-ZLBNIGwvaM593ZJnpn5-xUxjyWJ9CbA&s',
  },
  {
    'title': 'Jammu & Kashmir',
    'imageUrl': 'https://www.ekashmirtourism.com/wp-content/uploads/2022/08/dal-lake-winter.jpg',
  },
];*/
