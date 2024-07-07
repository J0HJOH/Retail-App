
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:timbu_shop/ui/log_in_screen.dart';

class WelcomePageSlider extends StatefulWidget {
  const WelcomePageSlider({super.key});

  @override
  State<WelcomePageSlider> createState() => _WelcomePageSliderState();
}

class _WelcomePageSliderState extends State<WelcomePageSlider> {
  final _pageController = PageController();
  int _currentPage = 1;

  List<WelcomeSlider> welcomeSlider = [
    WelcomeSlider(title: "Shop All Items", description: "All items you can ever want is right here. Just shop and pay",
        image: "shopping_cart.jpg"),
    WelcomeSlider(title: "Easy Come, Easy Go", description: "Payment made easy with credit, debit cards and Virtual cards",
        image: "woman_shopping.jpg"),
    WelcomeSlider(title: "Special Offers", description: "Special Days to grab special offers and cheap payments",
        image: "cyber_sale.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home : Scaffold(
          backgroundColor: Colors.greenAccent,
          body: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: (){
                          //   Navigate to Home Screen
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_)=> const LogInScreen())
                            );
                          },
                          child:  const Text("Skip",
                            style: TextStyle(
                                color: Colors.blue, fontSize: 16),
                          )
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                          itemCount: welcomeSlider.length,
                          onPageChanged: (value){
                          setState(() {
                            _currentPage = value;
                          });
                          },
                          itemBuilder: (context, index){
                          final item = welcomeSlider[index];
                            return Column(children: [
                                Image.asset(
                                  item.image, height: 350,),
                                const SizedBox(height: 10,),
                                Text(item.title,
                                  style: Theme.of(context)
                                    .textTheme.headlineMedium!
                                      .copyWith(color: Colors.black,
                                    fontWeight: FontWeight.bold, fontSize: 28
                                  ),),
                              const SizedBox(height: 5,),
                               Text( item.description,
                                  style: const TextStyle(color:
                                  Color.fromARGB(255, 94, 92, 92),
                                    fontSize: 20
                                  ),
                              ),
                              ],
                            );
                          }
                      ),
                    ),
                    Row(
                        children: List.generate(welcomeSlider.length, (index){
                        return Padding(padding: const EdgeInsets.only(right: 10.0),
                          child: AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                            height: 10,
                            width: _currentPage == index ?30 : 10,
                            decoration: BoxDecoration(
                                color: _currentPage == index ? Colors.blue : Colors.grey,
                            borderRadius: BorderRadius.circular(5)),
                          ),
                        );
                      }
                      )
                    )
                  ],
                ),
              )
          ),
          floatingActionButton: Builder(
            builder: (builderContext) => FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: (){
                _currentPage != welcomeSlider.length -1 ? _pageController.nextPage(
                    duration: const Duration(milliseconds: 300), curve: Curves.easeOut)
                    : Navigator.of(builderContext).pushReplacement(
                    MaterialPageRoute(builder: (builderContext) => const LogInScreen()));
              },

              child: _currentPage != welcomeSlider.length -1 ?
              const Icon(Icons.arrow_forward_ios) :
              const Icon(Icons.done),
            )
          ),
        ),
    );
  }
}

// if(_currentPage < welcomeSlider.length){
//   _pageController.nextPage(duration: Duration(milliseconds: 300),
//       curve: Curves.easeOut);
// }else if(_currentPage == welcomeSlider.length){
//   //   navigate to home screen
//   Navigator.of(context).push(
//       MaterialPageRoute(builder: (context)=> const LogInScreen())
//   );
// }

class WelcomeSlider{
  final String title;
  final String description;
  final String image;

  WelcomeSlider(
      { required this.title, required this.description,
        required this.image}
      );
}
