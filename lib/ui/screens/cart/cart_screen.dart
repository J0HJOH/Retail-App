import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timbu_shop/model/cart_item.dart';
import 'package:timbu_shop/ui/screens/cart/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  List<String> productNames = ["Nike", "Zara", "Houston", "Gucci","Prada"];

  List<int> quantity = [1,1,3,5,1];
  List<double> prices = [15.0,45.1,12.8,32.1,10.5];
  List<String> images = [
    "black_heels.jpg",
    "heels2.jpg",
    "men_shoe.jpg",
    "nike1.jpg",
    "nike3.jpg"
  ];

  void increment(CartItem item){
    setState(() {
      item.quantity++;
    });
  }
  void decrement(CartItem item){
    item.quantity==1
        ? setState(()=>SnackBar(content: Text("You have only 1 quanty",),
      dismissDirection: DismissDirection.endToStart,))
        : setState(()=>
      item.quantity--);
  }

  double getCartTotal(List<CartItem> cartItems){
    double total = 0.0;
    for (int i = 0; i<cartItems.length; i++){
      total += cartItems[i].quantity * cartItems[i].price;
    }
    return total;
  }
  void showCheckoutDialog(){
    showDialog(context: context,
        builder: (context)=>
            AlertDialog(
              title: Text("Checkout"),
              content: Text("Hurray You have purchased a product"),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                },
                    child: Text("Ok"))

              ],
            ));
  }


  @override
  Widget build(BuildContext context) {
    List<CartItem> cartItems = Provider
        .of<CartProvider>(context).cartItems;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Cart",
            style: TextStyle(fontSize: 26,
                fontWeight: FontWeight.bold),),

            Expanded(
                child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      CartItem item = cartItems[index];
                      return Dismissible(
              key: Key(cartItems[index].name),
              direction: DismissDirection.endToStart,
              onDismissed: (direction){
                setState(() {
                  cartItems.remove(index);
                });
              },
              background: Container(
                color: Colors.red,
                child: Icon(Icons.cancel, color: Colors.white,),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 16.0),
              ),
              child: Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.only(right: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                  Image.asset(
                    // images[index]
                    item.image,
                    height: 70,width: 70,),
                  SizedBox(width: 15.0,),

                  Column(children: [
                    Text(
                      // productNames[index],
                      item.name,
                      style: TextStyle(
                      fontSize: 18, color: Colors.grey
                    ),),
                    Text(
                      // "\$${prices[index]}"
                      "\$${item.price}"
                      , style: TextStyle(
                      fontSize: 16, color: Colors.grey
                    ),
                    ),],),
                  Spacer(),
                  Row(children: [
                    IconButton(onPressed: (){
                      decrement(item);
                    },
                        icon: Icon(Icons.remove)),
                    Text("${item.quantity}",
                      style: TextStyle(fontSize: 18.0
                    ),),
                    IconButton(onPressed: (){
                      increment(item);
                    },
                        icon: Icon(Icons.add))
                  ],)
                ],),
              ),
            );
                    }
                )
            ),
              Divider(),
              Padding(padding: EdgeInsets.all(16.0),
              child: Row(children: [
                Text("Cart Total: ", style: TextStyle(
                  fontSize: 18.0
                ),),
                SizedBox(width: 50.0,),
                Text("\$${getCartTotal(cartItems).toStringAsFixed(2)}", style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold

                ),)
              ],),),
              Divider(),
              Padding(padding: EdgeInsets.all(16.0),
              child: Row(children: [
                Expanded(child: ElevatedButton(
                  onPressed: (){
                    showCheckoutDialog();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green),
                  child: Text("Proceed Checkout"),
                ))
              ],),)
          ],
          ),
        ),
      )
    );
  }
}

