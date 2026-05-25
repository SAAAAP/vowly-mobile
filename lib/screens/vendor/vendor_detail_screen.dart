import 'package:flutter/material.dart';

class VendorDetailScreen extends StatelessWidget {

  final Map<String, dynamic> vendor;

  const VendorDetailScreen({
    super.key,
    required this.vendor,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(vendor['name']),
      ),

      body: SingleChildScrollView(

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            /// IMAGE
            Container(

              height: 280,

              color: Colors.pink.shade100,

              child: const Center(
                child: Icon(
                  Icons.photo_camera,
                  size: 80,
                  color: Colors.pink,
                ),
              ),
            ),

            Padding(

              padding: const EdgeInsets.all(20),

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  /// NAME
                  Text(
                    vendor['name'],
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// RATING
                  Row(

                    children: [

                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),

                      const SizedBox(width: 6),

                      Text(
                        vendor['rating'],
                        style: const TextStyle(
                          fontWeight:
                              FontWeight.bold,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 16),

                  /// LOCATION
                  Row(

                    children: [

                      const Icon(
                        Icons.location_on,
                        color: Colors.pink,
                      ),

                      const SizedBox(width: 8),

                      Text(
                        vendor['location'],
                      )
                    ],
                  ),

                  const SizedBox(height: 24),

                  /// DESCRIPTION
                  const Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    vendor['description'],
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// PRICE
                  Container(

                    width: double.infinity,

                    padding:
                        const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.pink.shade50,
                      borderRadius:
                          BorderRadius.circular(16),
                    ),

                    child: Column(

                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        const Text(
                          'Harga Mulai',
                        ),

                        const SizedBox(height: 8),

                        Text(
                          vendor['price'],
                          style: const TextStyle(
                            color: Colors.pink,
                            fontSize: 28,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  /// BUTTON
                  Row(

                    children: [

                      Expanded(

                        child: OutlinedButton(

                          onPressed: () {},

                          child: const Text(
                            'Chat',
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(

                        child: ElevatedButton(

                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.pink,
                          ),

                          onPressed: () {},

                          child: const Text(
                            'Negosiasi',
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}