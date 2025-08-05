import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  static const String id = "homePage";
  final PageController _pageController = PageController(viewportFraction: 0.8);

  List<ProductModel> products = [
    ProductModel(name: 'toy', price: 29.99, imageUrl: 'assets/images/1.png'),
    ProductModel(name: 'date', price: 49.99, imageUrl: 'assets/images/2.png'),
    ProductModel(name: 'cream', price: 19.99, imageUrl: 'assets/images/3.png'),
    ProductModel(
      name: 'avocado',
      price: 39.99,
      imageUrl: 'assets/images/4.png',
    ),
    ProductModel(name: 'cream2', price: 59.99, imageUrl: 'assets/images/5.png'),
    ProductModel(name: 'toy', price: 29.99, imageUrl: 'assets/images/1.png'),
    ProductModel(name: 'date', price: 49.99, imageUrl: 'assets/images/2.png'),
    ProductModel(name: 'cream', price: 19.99, imageUrl: 'assets/images/3.png'),
    ProductModel(
      name: 'avocado',
      price: 39.99,
      imageUrl: 'assets/images/4.png',
    ),
    ProductModel(name: 'cream2', price: 59.99, imageUrl: 'assets/images/5.png'),
    ProductModel(name: 'toy', price: 29.99, imageUrl: 'assets/images/1.png'),
    ProductModel(name: 'date', price: 49.99, imageUrl: 'assets/images/2.png'),
    ProductModel(name: 'cream', price: 19.99, imageUrl: 'assets/images/3.png'),
    ProductModel(
      name: 'avocado',
      price: 39.99,
      imageUrl: 'assets/images/4.png',
    ),
    ProductModel(name: 'toy', price: 29.99, imageUrl: 'assets/images/1.png'),
    ProductModel(name: 'cream2', price: 59.99, imageUrl: 'assets/images/5.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Our products',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      double value = 1.0;
                      if (_pageController.position.haveDimensions) {
                        value = (_pageController.page! - index).abs();
                        value = (1 - (value * 0.3)).clamp(0.0, 1.0);
                      }
                      return Center(
                        child: SizedBox(
                          height: Curves.easeOut.transform(value) * 200,
                          width: Curves.easeOut.transform(value) * 300,
                          child: child,
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          products[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Products',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(thickness: 1, color: Colors.grey),
            const SizedBox(height: 10),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.5 / 3,
              ),
              children: products.map((product) {
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(product.imageUrl, height: 100, width: 100),
                      const SizedBox(height: 10),
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_shopping_cart),
                            onPressed: () {
                              SnackBar snackBar = SnackBar(
                                content: Text('${product.name} added to cart!'),
                              );
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(snackBar);
                            },
                            color: Colors.blue,
                            iconSize: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              '🔥 Hot Offers',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.orange[100],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/${(index % 5) + 1}.png', // صور متنوعة
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Special offer on ${['toys', 'dates', 'cream', 'avocados', 'skincare'][index % 5]}! Limited time only!',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
