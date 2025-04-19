import 'dart:convert';
import 'dart:ui';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:yatra/features/feature_state/ui/place_details.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../feature_home/ui/home.dart';
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
    checkConnectivityAndLoad();
    //loadFromHive();
    //fetchApi();
  }

  // Fetch data from API
  fetchApi() async {
    final response = await http.get(
      Uri.parse(
          'https://tour-app-vlcc.onrender.com/api/states?populate=state_locations.Visitor_Information'),
    );
    print("check....${response.body}");
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
     print("API Response: ${jsonEncode(result)}");
      List<StateModel> fetchedStates = (result['data'] as List?)
              ?.map((state) => StateModel.fromJson(state))
              .toList() ??
          [];

     print("Fetched location: ${fetchedStates[0].locations}");

     //save data to Hive
      final box = await Hive.openBox<StateModel>('statesBox');
      await box.clear(); // clear old data before storing new
      await box.addAll(fetchedStates);

      setState(() {
        allPlaces = fetchedStates;
        filteredPlaces = List.from(allPlaces);
      });

      //print("All Places Length: ${allPlaces.length}");
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  }

  //load from hive if offline
  loadFromHive() async {
    try {
    final box = await Hive.openBox<StateModel>('statesBox');
    final cachedStates = box.values.toList();
    print('Total items in Hive: ${box.length}');

    setState(() {
      allPlaces = cachedStates;
      filteredPlaces = List.from(allPlaces);
    });
  }
  catch(e){
    print('Error loading from Hive: $e');
  }
  }

  //check internet connection forst
  Future<void> checkConnectivityAndLoad() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      print('No internet. Loading from Hive.');
      await loadFromHive();

      //show snack bar after loading offline data
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("You're offline. check your connection.")),
        );
      }
    } else {
      print('Internet available. Fetching API.');
      await fetchApi();
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
      body: Stack(
        children: [
          //background image
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Image.asset(
              'assets/image/sunset.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Explore India with..',
                        textStyle: GoogleFonts.overpass(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                    repeatForever: true,
                  ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ));
                    },
                    child: Text(
                      'Yatra',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                        ? const Center(
                            child: Text(
                            "No results found",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ))
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
          )
        ],
      ),
    );
  }

  // Widget for each grid item
  Widget _buildGridItem(StateModel item) {
    return InkWell(
      onTap: () async{
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaceDetailScreen(
              stateName: item.stateName,
              imageUrl: item.imageUrl ?? '',
              stateDescription: item.stateDescription ?? '',
              locations: item
                  .locations,
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
