import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _currentSlide = 0;
  int selectedButton =2;

  void selectButton(int buttonIndex){
    setState(() {
      selectedButton = buttonIndex;
    });
  }

  final List<String> _images = [
    "black_heels.jpg",
    "heels2.jpg"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: ()=> Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        CarouselSlider(
        options: CarouselOptions(
         height: 200.0,
         enlargeCenterPage: true,
         onPageChanged: (index, _){
           setState(() {
             _currentSlide = index;
           });
         }),
          items: _images.map((image) =>
              Builder(builder: (context)=>
                  Image.asset(image, fit: BoxFit.cover,))
          ).toList(),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Shoe",
              style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold
              ),),
              Spacer(),
              Text("\$16.99",
              style: TextStyle(fontSize: 16.0),)
            ],
            ),
          ),
        ),
        SizedBox(height: 16,),
        Padding(padding: EdgeInsets.all(10.0),
        child: Text("Product Description",
        style: TextStyle(fontSize: 22,
            fontWeight: FontWeight.bold),),
        ),

        Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("This is an amazing shoe", style:
              TextStyle(fontSize: 16),),
            Text("So amazing", style: TextStyle(fontSize: 16),),
            Text("true", style: TextStyle(fontSize: 16),),
          ],),
        ),
        Spacer(),
        Row(
          children: [
            Expanded(child: Container(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedButton == 1?Colors.green:Colors.white
                ),
                onPressed: (){
                  selectButton(1);
                },
                child: Text("RESELL",
                style: TextStyle(
                    color: selectedButton == 1?Colors.white:Colors.black,
                    fontSize: 18),
                ),

              ),
            )),
            Expanded(child: Container(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedButton == 2?Colors.green:Colors.white
                ),
                onPressed: (){selectButton(2);},
                child: Text("ADD TO CART",
                style: TextStyle(color: selectedButton == 2?Colors.white:Colors.black,
                    fontSize: 18),),

              ),
            ))
          ],
        )
        
      ],),
    );
  }
}
