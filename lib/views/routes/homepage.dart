import 'package:flutter/material.dart';
import 'package:myfood/models/foodApi.dart';
import 'package:myfood/models/foodmodel.dart';
import 'package:myfood/views/widgets/foodcard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<FoodModel> myFood;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getMyFood();
  }

  Future<void> getMyFood() async {
    myFood = await FoodApi.getMyFood();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          centerTitle: true,
          title: const Text(
            "My Food",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : ListView.builder(
                itemCount: myFood.length,
                itemBuilder: (context, index) {
                  return FoodCard(
                    title: myFood[index].name,
                    rating: myFood[index].rating.toString(),
                    cookTime: myFood[index].totalTime,
                    thumbnailUrl: myFood[index].images,
                  );
                },
              ));
  }
}
