import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:yatra/features/feature_state/ui/place_details.dart';

import '../model/state_model.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<StateModel> allPlaces = [];
  List<StateModel> filteredPlaces = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchApi();
  }

  // Fetch data from API
  fetchApi() async {
    final response = await http.get(
      Uri.parse('http://192.168.29.163:1337/api/states?populate=state_locations.Visitor_Information'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      //print("API Response: ${jsonEncode(result)}");
      List<StateModel> fetchedStates = (result['data'] as List?)
          ?.map((state) => StateModel.fromJson(state))
          .toList() ?? [];

      //print("Fetched States: $fetchedStates");

      setState(() {
        allPlaces = fetchedStates;
        filteredPlaces = List.from(allPlaces);
      });

      //print("All Places Length: ${allPlaces.length}");
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  }




  // Search Functionality
  void filterSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredPlaces = List.from(allPlaces);
      } else {
        filteredPlaces = allPlaces
            .where((place) =>
            place.stateName.toLowerCase().contains(query.toLowerCase()))
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
  Widget _buildGridItem(StateModel item) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaceDetailScreen(
              stateName: item.stateName,
              imageUrl: item.imageUrl ?? '',
              locations: item.locations, // Now correctly passed as List<Map<String, dynamic>>
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(item.imageUrl ?? ''),
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
                  item.stateName,
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