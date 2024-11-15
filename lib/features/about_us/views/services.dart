import 'package:flutter/material.dart';

class DrawerServicePage extends StatelessWidget {
  const DrawerServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Services'),
        backgroundColor: Colors.green,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AI Tarkari Shop: Fresh Vegetables Delivered to Your Door',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'We bring fresh, high-quality vegetables directly to your doorstep. Our platform ensures you get the best shopping experience with personalized recommendations and timely deliveries.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Our Services:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text('Fresh Vegetables Delivery'),
                subtitle: Text(
                    'Get fresh, locally sourced vegetables delivered to your door.'),
              ),
              ListTile(
                title: Text('Seasonal Produce'),
                subtitle: Text(
                    'We offer the best seasonal produce, so you always have what\'s in season.'),
              ),
              ListTile(
                title: Text('Custom Orders'),
                subtitle: Text(
                    'Choose the vegetables you want and we\'ll deliver them fresh.'),
              ),
              SizedBox(height: 20),
              Text(
                'Why Choose Us?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                  '• Freshness Guarantee: We ensure the highest quality produce.'),
              Text(
                  '• Reliable Delivery: Timely and dependable service every time.'),
              Text(
                  '• Sustainable Practices: We focus on sustainability in sourcing and packaging.'),
              SizedBox(height: 20),
              Text(
                'Customer Testimonials:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                  '"The best vegetable delivery service I have ever used!" - Kabir'),
              Text(
                  '"Fresh produce delivered quickly. Highly recommend!" - Raj'),
              SizedBox(height: 20),
              Text(
                'Got Questions? Contact Us!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                  'For inquiries, please email us at: support@a1tarkarishop.com'),
            ],
          ),
        ),
      ),
    );
  }
}
