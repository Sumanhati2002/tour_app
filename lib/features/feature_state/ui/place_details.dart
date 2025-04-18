import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yatra/features/feature_state/model/location_model.dart';

import '../../feature_statelocation_details/model/visitorInfo_model.dart';
import '../../feature_statelocation_details/ui/destination.dart';

class PlaceDetailScreen extends StatefulWidget {
  final String stateName;
  final String imageUrl;
  final String stateDescription;
  final List<StateLocation> locations;

  const PlaceDetailScreen(
      {super.key,
      required this.stateName,
      required this.imageUrl,
      required this.stateDescription,
      required this.locations});

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  bool isExpanded = false;

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
            ],
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    widget.stateName,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Description
                  Text(
                    widget.stateDescription,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    maxLines: isExpanded ? null : 2,
                    overflow: isExpanded
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text(
                      isExpanded ? 'Read less' : 'Read more',
                      style: const TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Facilities
                  Text(
                    'Must-Visit Destinations',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),
                  // List of Locations in the State
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: widget.locations.isNotEmpty
                              ? GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 3 / 4,
                                  ),
                                  itemCount: widget.locations.length,
                                  itemBuilder: (context, index) {
                                    return _buildLocationCard(
                                        widget.locations[index], context);
                                  })
                              : const Center(
                                  child: Text(
                                    "No locations available",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                )))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildLocationCard(StateLocation location, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DestinationDetailScreen(
            locationName: location.locationname ?? 'Unknown',
            imageUrl: location.image ?? '',
            description: location.description.isNotEmpty
                ? location.description
                : 'No description available',
            visitorInfo: location.visitorInformation.isNotEmpty
                ? location.visitorInformation[0]
                : VisitorInformation.empty(),
          ),
        ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(location.image ?? ''),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.0),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                location.locationname ?? 'Unknown',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
