import 'package:flutter/material.dart';

import 'vendor_detail_screen.dart';

class VendorListScreen extends StatelessWidget {

  final String category;

  VendorListScreen({
    super.key,
    required this.category,
  });

  final List<Map<String, dynamic>> vendors = [

    {
      'name': 'Light Capture',
      'price': 'Rp 5.000.000',
      'rating': '4.8',
      'location': 'Jakarta Selatan',
      'description':
          'Vendor fotografi profesional wedding.',
    },

    {
      'name': 'Memorable Photo',
      'price': 'Rp 4.000.000',
      'rating': '4.7',
      'location': 'Bandung',
      'description':
          'Dokumentasi wedding cinematic.',
    },

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(category),
      ),

      body: ListView.builder(

        padding: const EdgeInsets.all(16),

        itemCount: vendors.length,

        itemBuilder: (context, index) {

          final vendor = vendors[index];

          return GestureDetector(

            onTap: () {

              /// PINDAH KE DETAIL
              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (_) => VendorDetailScreen(
                    vendor: vendor,
                  ),
                ),
              );
            },

            child: Card(

              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(16),
              ),

              child: Padding(

                padding: const EdgeInsets.all(16),

                child: Row(

                  children: [

                    Container(

                      width: 90,
                      height: 90,

                      decoration: BoxDecoration(
                        color: Colors.pink.shade100,
                        borderRadius:
                            BorderRadius.circular(16),
                      ),

                      child: const Icon(
                        Icons.photo_camera,
                        color: Colors.pink,
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(

                      child: Column(

                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          Text(
                            vendor['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            '⭐ ${vendor['rating']}',
                          ),

                          const SizedBox(height: 8),

                          Text(
                            vendor['price'],
                            style: const TextStyle(
                              color: Colors.pink,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}