import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;

  const FoodCard({
    super.key,
    required this.title,
    required this.rating,
    required this.cookTime,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 22.0,
        vertical: 10.0,
      ),
      height: 180.0,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(0.0, 10.0),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          )
        ],
        image: DecorationImage(
          image: NetworkImage(thumbnailUrl),
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.multiply,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.w200,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 19,
                      ),
                      const SizedBox(
                        width: 7.0,
                      ),
                      Text(rating),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                        color: Colors.yellow,
                        size: 18.0,
                      ),
                      const SizedBox(
                        width: 7.0,
                      ),
                      Text(cookTime),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
