import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> previewImages = [
    "assets/images/kings.jpg",
    "assets/images/wednes.jpg",
    "assets/images/radensaleh.jpg",
    "assets/images/lapanbls.jpg",
    "assets/images/kretek.jpg",
    "assets/images/bokson.jpg",
    // Add more images as needed
  ];

  final List<Map<String, String>> continueWatchingMovies = [
    {'image': 'assets/images/radensaleh.jpg'},
    {'image': 'assets/images/lapanbls.jpg'},
    {'image': 'assets/images/kretek.jpg'},
    {'image': 'assets/images/bokson.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Get the screen size

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Background image
                Container(
                  height: size.height * 0.6, // 60% of the screen height
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/breakingbad.jpeg"), // Change to your image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Gradient overlay
                Container(
                  height: size.height * 0.6, // Overlay same height as image
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
                // Positioned row for the logo and text
                Positioned(
                  top: 40, // Adjusted top positioning
                  left: 10, // Left positioning for better alignment
                  right: 10, // Right positioning for better alignment
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // To space the elements evenly
                        children: [
                          Image(
                            width: 50, // Adjust width to make it smaller
                            height: 50, // Adjust height to maintain aspect ratio
                            image: const AssetImage("assets/images/netlog.png"), // Change to your logo
                          ),
                          // Text Buttons for TV Show, Movies, and My List
                          Row(
                            children: const [
                              Text(
                                "TV Shows",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 35),
                              Text(
                                "Movies",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 35),
                              Text(
                                "My List",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 200), // Add spacing to push down play button area

                      // Center Play Button and Info Button
                      Column(
                        children: [
                          const Text(
                            "#2 in INDONESIA Today",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: const [
                                  Icon(Icons.add, color: Colors.white),
                                  SizedBox(height: 5),
                                  Text(
                                    "My List",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  // Add your play button action here
                                },
                                icon: const Icon(Icons.play_arrow, color: Colors.black),
                                label: const Text(
                                  "Play",
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white, // Netflix-like button
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                ),
                              ),
                              Column(
                                children: const [
                                  Icon(Icons.info_outline, color: Colors.white),
                                  SizedBox(height: 5),
                                  Text(
                                    "Info",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Previews section (scrollable horizontally)
            SizedBox(
              height: size.height * 0.20, // Adjust height for the previews section
              child: Container(
                color: Colors.black, // Set background color to black
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Previews",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: previewImages.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 80, // Width of each preview item
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle, // Circular preview images
                              image: DecorationImage(
                                image: AssetImage(previewImages[index]), // Use image from the list
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Continue Watching section
            ContinueWatchingCarousel(movies: continueWatchingMovies),
          ],
        ),
      ),
    );
  }
}

class ContinueWatchingCarousel extends StatelessWidget {
  final List<Map<String, String>> movies;

  ContinueWatchingCarousel({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Set the background color to black
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column( // Change from Container to Column to hold text and scroll
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start (left)
        children: [
          Text(
            "Continue Watching for User",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0), // Space between text and scroll
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: movies.map((movie) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0), // Consistent horizontal spacing
                  child: Container(
                    width: 100,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(movie['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
