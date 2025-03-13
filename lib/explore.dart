import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:yatra/place_details.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<Map<String, dynamic>> allPlaces = []; // Store all places
  List<Map<String, dynamic>> filteredPlaces = []; // Store filtered places
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchApi();
  }

  // Fetch data from API
  fetchApi() async {
    final response = await http.get(
      Uri.parse(
          'http://192.168.29.163:1337/api/states?populate=state_locations.Visitor_Information'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);

      setState(() {
        allPlaces = List<Map<String, dynamic>>.from(result['data']);
        filteredPlaces = allPlaces; // Initially, show all places
      });
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  }

  // Search Functionality
  void filterSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredPlaces = allPlaces;
      } else {
        filteredPlaces = allPlaces
            .where((place) => place['statename']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Explore India with',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Yatra',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Search Bar with Auto-Suggestion
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: filterSearch, // Filter on text change
                  decoration: InputDecoration(
                    hintText: 'Find places by state',
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.grey[400]),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Grid Section with Filtered Places
              Expanded(
                child: filteredPlaces.isEmpty
                    ? const Center(child: Text("No results found"))
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 3 / 4,
                        ),
                        itemCount: filteredPlaces.length,
                        itemBuilder: (context, index) {
                          return _buildGridItem(filteredPlaces[index]);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for each grid item
  Widget _buildGridItem(Map<String, dynamic> item) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaceDetailScreen(
              stateName: item['statename'] ?? 'Unknown',
              imageUrl: item['url'] ?? '',
              locations: item['state_locations'] ?? [],
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(item['url'] ?? ''),
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
                  item['statename'] ?? 'Unknown',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
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
}
