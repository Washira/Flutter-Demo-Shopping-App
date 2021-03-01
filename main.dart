import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyShoppingPage(),
      ),
    );
  }
}

//Shopping Page
class MyShoppingPage extends StatelessWidget {
  MyShoppingPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          children: [
            Container(
                child: Row(
                  children: [
                    Expanded(
                        child: Row(
                            children: [menuButton],
                            textDirection: TextDirection.ltr)),
                    Expanded(
                        child: Row(children: [
                      CircleButton(Icons.shopping_cart, () {
                        Navigator.of(context).push(createRoute());
                        return null;
                      })
                    ], textDirection: TextDirection.rtl)),
                  ],
                ),
                width: 297),
            gapBetweenWidget(0, 30),
            shoesName,
            gapBetweenWidget(0, 20),
            shoesImage,
            gapBetweenWidget(0, 10),
            rowOfRating,
            gapBetweenWidget(0, 10),
            price,
            gapBetweenWidget(0, 10),
            AcceptButtonItem("Add to cart", Colors.green, () {
              Navigator.of(context).push(createRoute());
              return null;
            }),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 80),
      ),
    );
  }
}

var blank = () => {};

var gapBetweenWidget =
    (double width, double height) => SizedBox(height: height, width: width);

var menuButton = CircleButton(Icons.menu_sharp, blank);

var shoesName = Text(
  "Space Shoes",
  style: TextStyle(fontFamily: 'Sora', fontSize: 36),
);

var shoesImage = ShoesImageItem(297, 288);

var starRow = Row(
  children: [
    Icon(Icons.star, color: Color.fromARGB(255, 255, 240, 0)),
    Icon(Icons.star, color: Color.fromARGB(255, 255, 240, 0)),
    Icon(Icons.star, color: Color.fromARGB(255, 255, 240, 0)),
    Icon(Icons.star, color: Color.fromARGB(255, 236, 234, 234)),
    Icon(Icons.star, color: Color.fromARGB(255, 236, 234, 234)),
  ],
);

var rating = TextItem("136 Rating", 18);

var rowOfRating = Row(
    children: [starRow, rating], mainAxisAlignment: MainAxisAlignment.center);

var price =
    Text("2300 THB", style: TextStyle(fontFamily: 'Sora', fontSize: 18));

Route createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MySummaryPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final begin = Offset(1.0, 0.0);
      final end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

//Summary Page
class MySummaryPage extends StatelessWidget {
  MySummaryPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          children: [
            Container(
                child: Row(
                  children: [
                    Expanded(
                        child: Row(children: [
                      CircleButton(Icons.navigate_before, () {
                        Navigator.pop(context);
                        return null;
                      })
                    ], textDirection: TextDirection.ltr)),
                    Expanded(
                        child: Row(
                            children: [userButton],
                            textDirection: TextDirection.rtl)),
                  ],
                ),
                width: 297),
            gapBetweenWidget(0, 30),
            summaryTitle,
            gapBetweenWidget(0, 20),
            productDetailInSummary,
            gapBetweenWidget(0, 20),
            billing,
            gapBetweenWidget(0, 10),
            checkoutButton,
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      ),
    );
  }
}

var userButton = CircleButton(Icons.person, blank);

var menuBarInSummary = Container(
    child: Row(
      children: [
        Expanded(
            child:
                Row(children: [backButton], textDirection: TextDirection.ltr)),
        Expanded(
            child:
                Row(children: [userButton], textDirection: TextDirection.rtl)),
      ],
    ),
    width: 297);

var summaryTitle = TextItem("YOUR CART", 24);

var shoesImageInSummary = ShoesImageItem(125, 121);

var shoesNameSummary = TextItem("Space Shoes", 14);

var ratingInSummary = TextItem("136 Rating", 10);

var starRowInSummary = Row(
  children: [
    Icon(Icons.star, color: Color.fromARGB(255, 255, 240, 0), size: 15),
    Icon(Icons.star, color: Color.fromARGB(255, 255, 240, 0), size: 15),
    Icon(Icons.star, color: Color.fromARGB(255, 255, 240, 0), size: 15),
    Icon(Icons.star, color: Color.fromARGB(255, 236, 234, 234), size: 15),
    Icon(Icons.star, color: Color.fromARGB(255, 236, 234, 234), size: 15),
  ],
);

var productDetailInSummary = Container(
    child: Row(
      children: [
        Expanded(
            child: Row(
                children: [shoesImageInSummary],
                textDirection: TextDirection.ltr)),
        Expanded(
            child: Row(children: [
          Column(
              children: [
                shoesNameSummary,
                gapBetweenWidget(0, 50),
                ratingInSummary,
                gapBetweenWidget(0, 20),
                starRowInSummary
              ],
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start)
        ], textDirection: TextDirection.rtl)),
      ],
    ),
    width: 297);

var billing = Container(
  decoration: BoxDecoration(
      color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
  width: 297,
  height: 234,
  child: Container(
      child: Column(children: [
        Row(children: [
          Text("ODER SUMMARY",
              style: TextStyle(fontFamily: 'Sora', fontSize: 18))
        ]),
        gapBetweenWidget(0, 40),
        DetailInBilling("Sub Total", "2,300.00"),
        gapBetweenWidget(0, 20),
        DetailInBilling("Estimated Shipping", "0.00"),
        gapBetweenWidget(0, 20),
        DetailInBilling("Estimated Total", "2,300.00"),
      ]),
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 8)),
);

var checkoutButton = AcceptButtonItem("Checkout", Colors.red, blank);

//Creating Circle Button
class CircleButton extends StatelessWidget {
  IconData iconSharp;
  var onPressedFunc = () => {};

  CircleButton(this.iconSharp, this.onPressedFunc);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Ink(
        decoration: const ShapeDecoration(
          color: Color.fromARGB(255, 208, 211, 212),
          shape: CircleBorder(),
        ),
        child: IconButton(
          icon: Icon(iconSharp),
          color: Color.fromARGB(255, 0, 0, 0),
          onPressed: onPressedFunc,
        ),
      ),
    );
  }
}

//Creating Shoes Image
class ShoesImageItem extends StatelessWidget {
  final double height;
  final double width;

  ShoesImageItem(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 232, 237, 243),
          image: const DecorationImage(
            image: NetworkImage(
                'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?cs=srgb&dl=pexels-melvin-buezo-2529148.jpg&fm=jpg'),
            fit: BoxFit.cover,
          ),
          border:
              Border.all(width: 1.0, color: Color.fromARGB(255, 232, 237, 243)),
          borderRadius: BorderRadius.circular(10)),
      width: width,
      height: height,
    );
  }
}

//Creating Any Text for App
class TextItem extends StatelessWidget {
  final String text;
  final double size;

  TextItem(this.text, this.size);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontFamily: 'Sora', fontSize: size),
    );
  }
}

//Creating Accept and Checkout in App
class AcceptButtonItem extends StatelessWidget {
  final String text;
  final Color color;
  var onPressedFunc = () => {};

  AcceptButtonItem(this.text, this.color, this.onPressedFunc);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 91, 229, 97),
          borderRadius: BorderRadius.circular(10)),
      child: new ElevatedButton(
        onPressed: onPressedFunc,
        child: Text(text, style: TextStyle(fontFamily: 'Sora', fontSize: 18)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
      ),
      width: 297,
      height: 60,
    );
  }
}

//create detail in billing
class DetailInBilling extends StatelessWidget {
  final String text;
  final String price;

  DetailInBilling(this.text, this.price);
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Row(children: [
        Text(text, style: TextStyle(fontFamily: 'Sora', fontSize: 14))
      ], textDirection: TextDirection.ltr)),
      Expanded(
          child: Row(children: [
        Text("${price} THB", style: TextStyle(fontFamily: 'Sora', fontSize: 14))
      ], textDirection: TextDirection.rtl))
    ]);
  }
}
