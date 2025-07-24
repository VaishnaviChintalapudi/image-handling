import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Entry point of the Flutter app
}

// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp is the starting point for a Material-based app
    return const MaterialApp(
      home: ImageHandling(), // Loads the ImageHandling screen as home
    );
  }
}

// This widget handles displaying two images: one from assets and one from network
class ImageHandling extends StatelessWidget {
  const ImageHandling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Assignment 1")), // App bar title
      body: SizedBox(
        width: MediaQuery.of(context).size.width, // Full screen width
        height: MediaQuery.of(context).size.height, // Full screen height
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, // Spacing between the images
          children: [
            // ---- Local Asset Image with border radius and shadow ----
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black
                          .withOpacity(0.3), // Shadow color with transparency
                      spreadRadius: 4.0, // How wide the shadow spreads
                      blurRadius: 10 // Blur effect of the shadow
                      )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Rounded corners
                child: Image.asset(
                  'lib/assets/images/lehanga.jpg', // Path to local asset image
                  width: 300,
                  height: 300,
                  fit: BoxFit.fill, // Fills the box completely
                  alignment: Alignment.center,
                  filterQuality: FilterQuality.high, // Improves image quality
                ),
              ),
            ),

            // ---- Network Image with loading and error handling ----
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black
                          .withOpacity(0.3), // Shadow for network image
                      spreadRadius: 4.0,
                      blurRadius: 10)
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Rounded corners
                child: Image.network(
                  "https://thumbs.dreamstime.com/b/environment-earth-day-hands-trees-growing-seedlings-bokeh-green-background-female-hand-holding-tree-nature-field-118143566.jpg",
                  alignment: Alignment.center,
                  width: 300,
                  height: 300,
                  fit: BoxFit.fill, // Image fills the box

                  // Error handling if image fails to load
                  errorBuilder: (context, error, stackTrace) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(Icons.broken_image), // Broken image icon
                          SizedBox(height: 10),
                          Text("Sorry image not found") // Error message
                        ],
                      ),
                    );
                  },

                  // Shows loading indicator while image is being downloaded
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null)
                      return child; // When image is fully loaded
                    return const CircularProgressIndicator(
                      color: Colors.blue, // Progress indicator while loading
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
