import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showFilters = false;
  double _sliderValue = 0.7;

  // Responsive breakpoints
  bool get _isSmallScreen => MediaQuery.of(context).size.width < 600;
  bool get _isMediumScreen => MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 900;
  bool get _isLargeScreen => MediaQuery.of(context).size.width >= 900;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: _isSmallScreen ? 16.0 : 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSearchBar(),
                      if (_showFilters) _buildSearchFilters(),
                      SizedBox(height: _isSmallScreen ? 16 : 24),
                      _buildCategoryButtons(),
                      SizedBox(height: _isSmallScreen ? 16 : 24),
                      _buildPromoBanner(),
                      SizedBox(height: _isSmallScreen ? 16 : 24),
                      _buildCategoryTabs(),
                      SizedBox(height: _isSmallScreen ? 12 : 20),
                      _buildRecommendationsHeader(),
                      SizedBox(height: _isSmallScreen ? 12 : 16),
                      _buildRecommendations(),
                    ],
                  ),
                ),
              ),
            ),
            _buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: _isSmallScreen ? 16.0 : 20.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Hero(
            tag: 'profile_image',
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF5D3FD3), width: 2),
              ),
              child: const CircleAvatar(
                backgroundImage: NetworkImage('https://randomuser.me/api/portraits/women/44.jpg'),
                radius: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello Arun!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF2D3748),
                  ),
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.location_on,
                      color: Color(0xFF5D3FD3),
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'Bhanu-10, Tanahun',
                        style: TextStyle(
                          color: Color(0xFF718096),
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 0,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.notifications_outlined,
                    size: _isSmallScreen ? 22 : 24,
                    color: const Color(0xFF2D3748),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF4757),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: _isSmallScreen ? 2 : 4,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Color(0xFF718096)),
          const SizedBox(width: 12),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search your destination...',
                hintStyle: TextStyle(color: Color(0xFFA0AEC0)),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _showFilters = !_showFilters;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _showFilters ? const Color(0xFF5D3FD3) : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.tune,
                color: _showFilters ? Colors.white : const Color(0xFF718096),
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchFilters() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Filter your search',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF2D3748),
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.close, size: 20, color: Color(0xFF718096)),
                onPressed: () {
                  setState(() {
                    _showFilters = false;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildFilterSection('Price Range', isSlider: true),
          const SizedBox(height: 16),
          _buildFilterSection('Rating', options: ['Any', '3+', '4+', '4.5+']),
          const SizedBox(height: 16),
          _buildFilterSection('Property Type', options: ['All', 'Hotel', 'Resort', 'Villa', 'Apartment']),
          const SizedBox(height: 16),
          _buildFilterSection('Amenities', options: ['WiFi', 'Pool', 'AC', 'Restaurant', 'Parking']),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF5D3FD3),
                    elevation: 0,
                    side: const BorderSide(color: Color(0xFF5D3FD3)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Reset'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showFilters = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5D3FD3),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Apply'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(String title, {List<String>? options, bool isSlider = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color(0xFF4A5568),
          ),
        ),
        const SizedBox(height: 8),
        isSlider
            ? Column(
                children: [
                  SliderTheme(
                    data: SliderThemeData(
                      thumbColor: const Color(0xFF5D3FD3),
                      activeTrackColor: const Color(0xFF5D3FD3),
                      inactiveTrackColor: const Color(0xFFE2E8F0),
                      trackHeight: 4,
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                    ),
                    child: Slider(
                      value: _sliderValue,
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$0', style: TextStyle(color: Color(0xFF718096))),
                        Text('\$200', style: TextStyle(color: Color(0xFF718096))),
                        Text('\$500+', style: TextStyle(color: Color(0xFF718096))),
                      ],
                    ),
                  ),
                ],
              )
            : Wrap(
                spacing: 8,
                runSpacing: 8,
                children: options!.map((option) {
                  final bool isSelected = option == 'All' || option == 'Any' || option == 'WiFi';
                  return InkWell(
                    onTap: () {
                      // Toggle selection (would need proper state management in a real app)
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFF5D3FD3).withOpacity(0.1) : const Color(0xFFF7FAFC),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected ? const Color(0xFF5D3FD3) : const Color(0xFFE2E8F0),
                        ),
                      ),
                      child: Text(
                        option,
                        style: TextStyle(
                          color: isSelected ? const Color(0xFF5D3FD3) : const Color(0xFF718096),
                          fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
      ],
    );
  }

  Widget _buildCategoryButtons() {
    final categories = [
      {'icon': Icons.apartment, 'label': 'Hotels', 'color': const Color(0xFF5D3FD3)},
      {'icon': Icons.flight, 'label': 'Flight', 'color': const Color(0xFF00B5AD)},
      {'icon': Icons.directions_bus, 'label': 'Bus', 'color': const Color(0xFFFF9F43)},
      {'icon': Icons.train, 'label': 'Train', 'color': const Color(0xFFFF6B6B)},
    ];

    // For small screens, adjust the size
    final itemWidth = _isSmallScreen ? 65.0 : 70.0;
    final itemHeight = _isSmallScreen ? 65.0 : 70.0;
    final iconSize = _isSmallScreen ? 26.0 : 30.0;

    return SizedBox(
      height: _isSmallScreen ? 120 : 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final Color color = category['color'] as Color;
          
          return Padding(
            padding: EdgeInsets.only(
              right: index < categories.length - 1 ? _isSmallScreen ? 12 : 16 : 0,
            ),
            child: Column(
              children: [
                Container(
                  width: itemWidth,
                  height: itemHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    category['icon'] as IconData,
                    color: color,
                    size: iconSize,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  category['label'] as String,
                  style: TextStyle(
                    fontSize: _isSmallScreen ? 13 : 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF2D3748),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      height: _isSmallScreen ? 220 : 180,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF5D3FD3), Color(0xFF8B5CF6)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5D3FD3).withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: EdgeInsets.all(_isSmallScreen ? 16 : 20),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Travel Smart,\nStay Comfortable',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _isSmallScreen ? 16 : 18,
                    color: Colors.white,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: _isSmallScreen ? 8 : 10),
                Text(
                  'Plan your trip, book your stay, and get moving – all in one app',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: _isSmallScreen ? 12 : 13,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: _isSmallScreen ? 12 : 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF5D3FD3),
                    padding: _isSmallScreen
                        ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
                        : const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          if (!_isSmallScreen)
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Background decorative circle
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    // Travel icon
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.flight_takeoff,
                        color: Color(0xFF5D3FD3),
                        size: 40,
                      ),
                    ),
                    // Additional decorative elements
                    Positioned(
                      top: 20,
                      right: 30,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 20,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFF5D3FD3),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: const Color(0xFF718096),
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        tabs: const [
          Tab(text: 'All'),
          Tab(text: 'Hotels'),
          Tab(text: 'Resorts'),
          Tab(text: 'Villas'),
          Tab(text: 'Apartments'),
        ],
      ),
    );
  }

  Widget _buildRecommendationsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recommendations',
          style: TextStyle(
            fontSize: _isSmallScreen ? 18 : 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2D3748),
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF5D3FD3),
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          child: const Text('See all'),
        ),
      ],
    );
  }

  Widget _buildRecommendations() {
    final recommendations = [
      {
        'imageUrl': 'https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        'title': 'Luxury Villa & Resort',
        'location': 'Chitwan, Nepal',
        'rating': 4.8,
        'price': '\$120/night'
      },
      {
        'imageUrl': 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        'title': 'Mountain View Hotel',
        'location': 'Pokhara, Nepal',
        'rating': 4.6,
        'price': '\$95/night'
      },
    ];

    // For large screens, display items in a grid
    if (_isLargeScreen) {
      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          final item = recommendations[index];
          return _buildRecommendationCard(
            imageUrl: item['imageUrl'] as String,
            title: item['title'] as String,
            location: item['location'] as String,
            rating: item['rating'] as double,
            price: item['price'] as String,
          );
        },
      );
    }

    // For small and medium screens, display items as a list
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: recommendations.length,
      itemBuilder: (context, index) {
        final item = recommendations[index];
        return Padding(
          padding: EdgeInsets.only(bottom: index < recommendations.length - 1 ? 16 : 0),
          child: _buildRecommendationCard(
            imageUrl: item['imageUrl'] as String,
            title: item['title'] as String,
            location: item['location'] as String,
            rating: item['rating'] as double,
            price: item['price'] as String,
          ),
        );
      },
    );
  }

  Widget _buildRecommendationCard({
    required String imageUrl,
    required String title,
    required String location,
    required double rating,
    required String price,
  }) {
    return Container(
      height: _isSmallScreen ? 230 : 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                tag: title, // For transition animations
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: _isSmallScreen ? 150 : 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: _isSmallScreen ? 150 : 180,
                        color: Colors.grey[200],
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: _isSmallScreen ? 150 : 180,
                        color: Colors.grey[200],
                        child: const Center(child: Icon(Icons.error)),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xFFFFB74D), size: 18),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF2D3748),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: InkWell(
                  onTap: () {
                    // Add to favorites logic
                  },
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Color(0xFFFF6B6B),
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _isSmallScreen ? 15 : 16,
                          color: const Color(0xFF2D3748),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 14, color: Color(0xFF718096)),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              location,
                              style: const TextStyle(
                                color: Color(0xFF718096),
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _isSmallScreen ? 14 : 16,
                        color: const Color(0xFF5D3FD3),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'per night',
                      style: TextStyle(
                        color: Color(0xFF718096),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(Icons.home, 'Home', isActive: true),
          _buildBottomNavItem(Icons.search, 'Explore'),
          _buildBottomNavItem(Icons.bookmark_border, 'Saved'),
          _buildBottomNavItem(Icons.person_outline, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, {bool isActive = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isActive ? const Color(0xFF5D3FD3) : const Color(0xFF718096),
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? const Color(0xFF5D3FD3) : const Color(0xFF718096),
          ),
        ),
      ],
    );
  }
}