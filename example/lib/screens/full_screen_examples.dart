import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import './app_bar.dart';

class FullScreenExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const ExampleAppBar(
            title: "Full Screen Examples",
            showGoBack: true,
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              ExampleButtonNode(
                title: "Large Image",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FullScreenWrapper(
                              imageProvider:
                                  const AssetImage("assets/large-image.jpg"),
                            ),
                      ));
                }),
              ExampleButtonNode(
                title: "Small Image (custom background)",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FullScreenWrapper(
                            imageProvider:
                                const AssetImage("assets/small-image.jpg"),
                            backgroundColor: Colors.pinkAccent,
                          ),
                    ),
                  );
                }),
              ExampleButtonNode(
                title: "Image from the internet",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FullScreenWrapper(
                            imageProvider: const NetworkImage(
                                "https://source.unsplash.com/900x1600/?camera,paper"),
                          ),
                    ),
                  );
                }),
              ExampleButtonNode(
                  title: "Animated GIF",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FullScreenWrapper(
                          imageProvider: const AssetImage("assets/peanut.gif"),
                          backgroundColor: Colors.white,
                          maxScale: 2.0,
                        ),
                      ),
                    );
                  }),

              ExampleButtonNode(
                title: "Limited scale",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenWrapper(
                        imageProvider: const AssetImage("assets/large-image.jpg"),
                        minScale: PhotoViewComputedScale.contained * 0.8,
                        maxScale: PhotoViewComputedScale.covered * 1.1,
                      ),
                    ),
                  );
                }),
            ],
          ))
        ],
      ),
    );
  }
}

class ExampleButtonNode extends StatelessWidget {
  final String title;
  final Function onPressed;

  const ExampleButtonNode({
    this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 21.0,
              fontWeight: FontWeight.w600),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10.0,
            ),
            child: RaisedButton(
              onPressed: onPressed,
              child: const Text("Open example"),
              color: Colors.amber,
            ))
        ],
      ));
  }
}

class FullScreenWrapper extends StatelessWidget {
  final ImageProvider imageProvider;
  final Widget loadingChild;
  final Color backgroundColor;
  final dynamic minScale;
  final dynamic maxScale;

  const FullScreenWrapper(
    {this.imageProvider,
    this.loadingChild,
    this.backgroundColor,
    this.minScale,
    this.maxScale});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child: PhotoView(
        imageProvider: imageProvider,
        loadingChild: loadingChild,
        backgroundColor: backgroundColor,
        minScale: minScale,
        maxScale: maxScale,
      ));
  }
}
