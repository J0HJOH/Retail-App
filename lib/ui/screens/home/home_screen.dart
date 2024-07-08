import 'package:flutter/material.dart';
import 'package:timbu_shop/services/product_service.dart';
import 'package:timbu_shop/ui/screens/home/product_details.dart';

import '../../../model/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<ProductItem> productItems = [];

  String searchString = '';


  @override
  void initState() {
    super.initState();

    final data = ProductService();
    final myItems = data.fetchData();

    debugPrint(myItems.toString());

    productItems = [
      ProductItem(title: "Nike",
          images: ["nike2.jpg","nike3.jpg","nike1.jpg",],
          pricing: "\$30"),
      ProductItem(title: "Stilettos",
          images: ["black_heels.jpg","heels2.jpg",],
          pricing: "\$15"),
      ProductItem(title: "Nike",
          images: ["nike1.jpg","nike3.jpg"],
          pricing: "\$30"),
      ProductItem(title: "Men Shoe",
          images: ["men_shoe.jpg"],
          pricing: "\$10"),
      ProductItem(title: "Nike",
          images: ["nike3.jpg","nike1.jpg","nike2.jpg"],
          pricing: "\$30"),
    ];



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.greenAccent
              ),
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.all(16.0),
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(child: TextField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0
                        ),
                        hintText: "Search Shoes, Phones and lots more..",
                        border: InputBorder.none,
                        icon: Icon(Icons.search)
                      ),
                      onChanged: (value){
                        setState(() {
                          searchString = value;
                        });
                      },
                    ),
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.filter_list))
                  ],
                ),
              ),
            ),
            Expanded(
                child: GridView.count(crossAxisCount: 2,
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: productItems.where((productItem)=>
                      productItem.title.toLowerCase().
                      contains(searchString.toLowerCase()))
                      .map((productItem)=>
                      buildCard(productItem)).toList()
                )
            )
          ],
        ),
      )
    );
  }


  Widget buildCard(ProductItem productItem){
    return GestureDetector(
      onTap: ()async{
        await Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => ProductDetails( product: productItem,)
            )
        );
      },
      child: Card(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/10,
            child: PageView.builder(
              itemCount: productItem.images.length,
                onPageChanged: (int index){
                setState(() {
                  productItem.currentIndex == index;
                });
                },
                itemBuilder: (context, index){
              return Image.asset(
                productItem.images[index],
                fit: BoxFit.cover,
              );
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(productItem.images.length,
              (int circleindex){
            return Padding(padding: EdgeInsets.all(4.0),
            child: CircleAvatar(radius: 4,
            backgroundColor:
            circleindex == productItem.currentIndex
                ? Colors.blue
                : Colors.grey,
            ),
            );
              }
          ),
          ),
          ListTile(
            title: Text(
              productItem.title,
              style: TextStyle(
                color: Colors.black
              ),),
            subtitle: Text(productItem.pricing),
            trailing: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: Text(
                "Premium", style: TextStyle(
                  color: Colors.white
              ),
              ),
            ),
          )
        ],),
      ),
    );
  }
}


