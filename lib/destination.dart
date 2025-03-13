import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DestinationDetailScreen extends StatelessWidget {
  const DestinationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Image Section with Back Button and Favorite
          Stack(
            children: [
              // Main Image
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                child: Image.network(
                  'https://www.ttrikon.com/system/images/000/765/742/fe60c309bc37f5b4cedb6a8c8af26e70/x600gt/Kedarnath.jpg?1723099395',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Back Button
              Positioned(
                top: 48,
                left: 16,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              // Favorite Button
              Positioned(
                bottom: 16,
                right: 16,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),

          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Map Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Coeurdes Alpes',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Show map',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),

                  // Rating
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '4.5',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        ' (355 Reviews)',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Description
                  Text(
                    'Aspen is as close as one can get to a storybook alpine town in America. '
                        'The choose-your-own-adventure possibilities—skiing, hiking, dining, shopping, and more.',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),

                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: const Text('Read more'),
                  ),

                  const SizedBox(height: 24),

                  // Facilities Title
                  Text(
                    'Facilities',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Tabs for Gallery, Description, and Visitor Information
                  Expanded(
                    child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          const TabBar(
                            labelColor: Colors.blue,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: Colors.blue,
                            tabs: [
                              Tab(text: 'Gallery'),
                              Tab(text: 'Description'),
                              Tab(text: 'Visitor Info'),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                _buildGalleryTab(),       // Gallery Tab
                                _buildDescriptionTab(),   // Description Tab
                                _buildVisitorInfoTab(),   // Visitor Info Tab
                              ],
                            ),
                          ),
                        ],
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

  // Gallery Tab Content
  Widget _buildGalleryTab() {
    List<String> images = [
      'https://www.ttrikon.com/system/images/000/765/742/fe60c309bc37f5b4cedb6a8c8af26e70/x600gt/Kedarnath.jpg?1723099395',
      'https://www.ttrikon.com/system/images/000/765/742/fe60c309bc37f5b4cedb6a8c8af26e70/x600gt/Kedarnath.jpg?1723099395',
      'https://www.ttrikon.com/system/images/000/765/742/fe60c309bc37f5b4cedb6a8c8af26e70/x600gt/Kedarnath.jpg?1723099395'
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(images[index], fit: BoxFit.cover),
          );
        },
      ),
    );
  }

  // Description Tab Content
  Widget _buildDescriptionTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Text(
          "Kedarnath is a Hindu temple dedicated to Lord Shiva, located in the Himalayas. "
              "It is one of the 12 Jyotirlingas and a significant pilgrimage site in India. "
              "Surrounded by breathtaking mountains, it attracts thousands of devotees and trekkers every year.",
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[700]),
        ),
      ),
    );
  }

  // Visitor Information Tab Content
  Widget _buildVisitorInfoTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.blue),
              title: Text(
                "Location",
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Uttarakhand, India"),
            ),
            ListTile(
              leading: const Icon(Icons.access_time, color: Colors.blue),
              title: Text(
                "Best Time to Visit",
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("April - November"),
            ),
            ListTile(
              leading: const Icon(Icons.directions, color: Colors.blue),
              title: Text(
                "How to Reach",
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("By trekking, helicopter services, or road transport."),
            ),
          ],
        ),
      ),
    );
  }
}
