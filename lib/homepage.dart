import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
      {
        'name': 'Resorts',
        'icon': Icons.apartment_outlined,
      }, // Corrected 'resoort' to 'resort'
      {'name': 'Villas', 'icon': Icons.villa},
      {
        'name': 'Restro',
        'icon': Icons.apartment,
      }, // Corrected 'Apprtmeent' to 'apartment'
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
                        color: Colors.black,
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
                    color: Colors.black,
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
                  color: Colors.green,
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
                separatorBuilder:
                  (context, index) => const SizedBox(width: 8),
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
                              color: Colors.green,
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
                    color: Colors.green,
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
                                'Learn More',
                                style: TextStyle(
                                  color: Colors.black,
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

                SizedBox(
                  height: 50,

                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: travelCategories.length,
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final topnav = topNavCategories[index];
                      return Container(
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
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
 
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("New Locations",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
                        Text("Sell all",style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.green),),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          
                          child: Image.network('https://media-cdn.tripadvisor.com/media/photo-o/29/83/84/e2/hotel-siraichuli.jpg',
                          height: 100,
                          )
                           
                          ),
                        
                          Column(
                          
                            children: [
                              Container(
                                height: 80,
                                child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("JC Hotel",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                   Text("New Locations",style: TextStyle(fontSize:1 ,fontWeight: FontWeight.normal),),
                                 ], 

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("\$23",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
                                      Text("loremjsjd",style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: const Color.fromARGB(255, 114, 120, 114)),),
                                    ],
                                  ),
                                ),
                              )
                              
                            ],
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.favorite,color: Colors.red,),
                            ],
                          )
                      ],
                    )
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
