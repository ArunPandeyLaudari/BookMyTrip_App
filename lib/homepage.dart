import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  Widget buildStars(int starCount) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 16,
          color: starCount >= 1 ? Colors.amber : Colors.grey,
        ),
        Icon(
          Icons.star,
          size: 16,
          color: starCount >= 2 ? Colors.amber : Colors.grey,
        ),
        Icon(
          Icons.star,
          size: 16,
          color: starCount >= 3 ? Colors.amber : Colors.grey,
        ),
        Icon(
          Icons.star,
          size: 16,
          color: starCount >= 4 ? Colors.amber : Colors.grey,
        ),
        Icon(
          Icons.star,
          size: 16,
          color: starCount >= 5 ? Colors.amber : Colors.grey,
        ),
      ],
    );
  }

  // Hotel Card Widget
  Widget hotelCard({
    required String imageUrl,
    required String name,
    required String location,
    required double price,
    required int rating,
  }) {
    return Card(
      shadowColor: Colors.amberAccent,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hotel Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
      
            // Hotel Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(location, style: const TextStyle(color: Color.fromARGB(255, 77, 68, 68))),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Text("\$$price", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      const Text("per night", style: TextStyle(color: Color.fromARGB(255, 73, 66, 66))),
                    ],
                  ),
                ],
              ),
            ),
      
            // Favorite and Rating
            SizedBox(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.favorite,   color: Color.fromRGBO(220, 7, 14, 1),),
                  buildStars(rating),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final travelCategories = [
      {"name": "Hotels", "icon": Icons.hotel},
      {"name": "Flight", "icon": Icons.flight},
      {"name": "Bus", "icon": Icons.directions_bus},
      {"name": "Train", "icon": Icons.train},
      {"name": "Cruise", "icon": Icons.directions_boat},
    ];

    final topNavCategories = [
      {'name': 'All', 'icon': Icons.all_inclusive},
      {'name': 'Hotels', 'icon': Icons.hotel},
      {'name': 'Resorts', 'icon': Icons.apartment_outlined},
      {'name': 'Villas', 'icon': Icons.villa},
      {'name': 'Restro', 'icon': Icons.apartment},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top bar with profile, location & notification
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Profile and greeting
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/images/travel.png',
                          ),
                          radius: 24,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hello Arun',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.location_pin,
                                  color: Color.fromRGBO(255, 145, 0, 1),
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Chitwan, Nepal',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 102, 96, 96),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Notification icon with red dot
                    Stack(
                      children: [
                        const Icon(
                          Icons.notifications,
                          size: 28,
                          color: Color.fromRGBO(255, 145, 0, 1),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Search bar
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: 'Search location to go home..',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 145, 0, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Icon(Icons.filter_list, color: Colors.white),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Horizontal category list
                SizedBox(
                  height: 80,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: travelCategories.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final category = travelCategories[index];
                      return Container(
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              category["icon"] as IconData,
                              size: 30,
                              color: Color.fromRGBO(255, 145, 0, 1),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              category["name"] as String,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 24),

                // Promo banner
                Container(
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 145, 0, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Travel Smart\nStay Comfortable',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'We have updated our General Terms \n of Use to make the language easier to understand.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 5,
                                ),
                              ),
                              child: const Text(
                                'Learn More.',
                                style: TextStyle(
                                  color: Color.fromRGBO(30, 29, 29, 1),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: -30,
                        bottom: 0,
                        child: Image.asset(
                          'assets/images/travel.png',
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Top navigation categories
                SizedBox(
                  height: 50,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: topNavCategories.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final topnav = topNavCategories[index];
                      return Container(
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(255, 145, 0, 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              topnav["icon"] as IconData,
                              size: 18,
                              color: Colors.white,
                            ),
                            Text(
                              topnav["name"] as String,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // New locations section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "New Locations",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color.fromRGBO(255, 145, 0, 1),
                      ),
                    ),
                  ],
                ),

                // Hotel cards
                Column(
                  children: [
                    hotelCard(
                      imageUrl: 'https://media-cdn.tripadvisor.com/media/photo-o/29/83/84/e2/hotel-siraichuli.jpg',
                      name: 'Peace Inn',
                      location: 'Downtown',
                      price: 45.0,
                      rating: 2,
                    ),

                    hotelCard(
                      imageUrl: 'https://media.gettyimages.com/id/184609057/photo/luxury-hotel-room.jpg?s=612x612&w=0&k=20&c=NN1OTddvUxGx-CNSHYe2SQvsV7diMg8AByIlnHM39Xw=',
                      name: 'Hotel Everest',
                      location: 'Kathmandu, Nepal',
                      price: 50.0,
                      rating: 4,
                    ),
                    hotelCard(
                      imageUrl: 'https://t3.ftcdn.net/jpg/00/83/06/20/360_F_83062064_gN5sYVuZs7jHCACvnKK2wmswceI32YHY.jpg',
                      name: 'Mountain View Resort',
                      location: 'Pokhara, Nepal',
                      price: 60.0,
                      rating: 5,
                    ),
                    hotelCard(
                      imageUrl: 'https://media-cdn.tripadvisor.com/media/photo-o/29/83/84/e2/hotel-siraichuli.jpg',
                      name: 'Lakeside Inn',
                      location: 'Phewa Lake, Nepal',
                      price: 40.0,
                      rating: 3,
                    ),
                  ],

                  
                ),

                Card(
                  elevation: 1,
                  shadowColor: Colors.orange,
                  child: ListTile(
                                contentPadding: EdgeInsets.all(0),
                    leading: Image.network('https://t3.ftcdn.net/jpg/00/83/06/20/360_F_83062064_gN5sYVuZs7jHCACvnKK2wmswceI32YHY.jpg',
                    
                    
                    ),
                    title: Column(
                      spacing: 5,
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Baigaicha Hotel",style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold ),
                        ),
                         Text(
                          "China Town",style: TextStyle(fontSize: 14,fontWeight:FontWeight.normal,color: Colors.grey ),
                         )

                         
                      ],
                      
                    ),
                    trailing: SizedBox(
                      width: 50,
                      // height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Icon(Icons.favorite,color:Colors.red,size: 18,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star,color: Colors.amber,size: 18,),
                            Text("4.3K")
                          ],
                         )
                         
                        ],
                      ),
                    )
                  ),
                )
              ],

            

            
            ),

          
          ),

        
        ),
      ),
    );
  }
}