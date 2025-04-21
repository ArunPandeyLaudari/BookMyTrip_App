       Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recomendation",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Stack(
                      children: [
                        // Background container for the card
                        Container(
                          height: 220,
                          width: 250,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 56, 122, 58),
                            borderRadius: BorderRadius.circular(
                              12,
                            ), // Added border radius
                          ),
                        ),

                        // Content overlay
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image with heart icon
                              Stack(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(12),
                                      ), // Match parent radius
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                          'https://media-cdn.tripadvisor.com/media/photo-o/29/83/84/e2/hotel-siraichuli.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  // Heart icon button - simplified and fixed positioning
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        padding:
                                            EdgeInsets
                                                .zero, // Remove default padding
                                        iconSize: 16, // Smaller icon size
                                        icon: const Icon(
                                          Icons.favorite_border,
                                          color: Color.fromARGB(
                                            255,
                                            132,
                                            36,
                                            36,
                                          ),
                                        ),
                                        onPressed: () {
                                          // Handle favorite action
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Title and details
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Spider Hotel',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          '4.8',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          '2.5 km',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 4),

                                    const Text(
                                      '\$25.00',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),