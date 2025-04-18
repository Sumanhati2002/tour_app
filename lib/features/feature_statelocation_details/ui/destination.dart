import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yatra/features/feature_statelocation_details/model/visitorInfo_model.dart';

class DestinationDetailScreen extends StatefulWidget {
  final String locationName;
  final String imageUrl;
  final String description;
  final VisitorInformation visitorInfo;

  const DestinationDetailScreen({
    super.key,
    required this.locationName,
    required this.imageUrl,
    required this.description,
    required this.visitorInfo,
  });

  @override
  State<DestinationDetailScreen> createState() =>
      _DestinationDetailScreenState();
}

class _DestinationDetailScreenState extends State<DestinationDetailScreen> {
  bool isExpand = false;

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
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(32)),
                child: Image.network(
                  widget.imageUrl,
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
              /*Positioned(
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
              ),*/
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
                      Expanded(
                        child: Text(
                          widget.locationName,
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
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
                  /*Row(
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
                  ),*/

                  const SizedBox(height: 16),

                  // Description
                  Text(
                    widget.description,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    maxLines: isExpand ? null : 2,
                    overflow:
                        isExpand ? TextOverflow.visible : TextOverflow.ellipsis,
                  ),

                  TextButton(
                    onPressed: () {
                      setState(() {
                        isExpand = !isExpand;
                      });
                    },
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text(isExpand ? 'read less' : 'read more'),
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
                  Flexible(
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
                                _buildGalleryTab(), // Gallery Tab
                                _buildDescriptionTab(), // Description Tab
                                _buildVisitorInfoTab(), // Visitor Info Tab
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
          widget.description,
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
              subtitle: Text(
                widget.visitorInfo.address ?? "Address not available",
                style: GoogleFonts.poppins(),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.access_time, color: Colors.blue),
              title: Text(
                "opening_hours",
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(widget.visitorInfo.openingHours??'No opening hours available'),
            ),
            ListTile(
              leading: const Icon(Icons.money, color: Colors.blue),
              title: Text(
                "entry_fee",
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(widget.visitorInfo.entryFee??''),
            ),
            ListTile(
              leading: const Icon(Icons.contact_phone, color: Colors.blue),
              title: Text(
                "contact_information",
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(widget.visitorInfo.contactInformation??''),
            ),
          ],
        ),
      ),
    );
  }
}
