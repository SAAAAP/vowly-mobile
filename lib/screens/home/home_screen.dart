import 'package:flutter/material.dart';

import '../vendor/vendor_detail_screen.dart';
import '../vendor/vendor_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final categories = [

      {
        'title': 'Fotografer',
        'icon': Icons.camera_alt,
      },

      {
        'title': 'MUA',
        'icon': Icons.face,
      },

      {
        'title': 'Dekorasi',
        'icon': Icons.chair,
      },

      {
        'title': 'MC',
        'icon': Icons.mic,
      },

      {
        'title': 'WO',
        'icon': Icons.favorite,
      },

      {
        'title': 'Catering',
        'icon': Icons.restaurant,
      },
    ];

    final vendors = [

      {
        'name': 'Light Capture',
        'price': 'Rp 5.000.000',
        'rating': '4.8',
        'location': 'Jakarta Selatan',
        'description':
            'Vendor fotografi wedding profesional',
      },

      {
        'name': 'Memorable Photo',
        'price': 'Rp 4.000.000',
        'rating': '4.7',
        'location': 'Bandung',
        'description':
            'Foto cinematic wedding',
      },
    ];

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(

        backgroundColor: Colors.white,

        elevation: 0,

        title: const Text(
          'Vowly',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),

      body: ListView(

        padding: const EdgeInsets.all(16),

        children: [

          /// SEARCH
          TextField(

            decoration: InputDecoration(

              hintText: 'Cari vendor...',

              prefixIcon:
                  const Icon(Icons.search),

              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(14),
              ),
            ),
          ),

          const SizedBox(height: 24),

          /// CATEGORY TITLE
          const Text(
            'Kategori',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          /// CATEGORY GRID
          GridView.builder(

            shrinkWrap: true,

            physics:
                const NeverScrollableScrollPhysics(),

            itemCount: categories.length,

            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 3,

              mainAxisSpacing: 12,

              crossAxisSpacing: 12,

              childAspectRatio: 1,
            ),

            itemBuilder: (context, index) {

              final category =
                  categories[index];

              return InkWell(

                borderRadius:
                    BorderRadius.circular(16),

                onTap: () {

                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (_) =>
                          VendorListScreen(

                        category:
                            category['title']
                                .toString(),
                      ),
                    ),
                  );
                },

                child: Container(

                  decoration: BoxDecoration(

                    borderRadius:
                        BorderRadius.circular(
                            16),

                    border: Border.all(
                      color:
                          Colors.pink.shade100,
                    ),
                  ),

                  child: Column(

                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [

                      Icon(
                        category['icon']
                            as IconData,
                        color: Colors.pink,
                        size: 32,
                      ),

                      const SizedBox(height: 8),

                      Text(
                        category['title']
                            .toString(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 28),

          /// RECOMMENDATION TITLE
          const Text(
            'Rekomendasi Vendor',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          /// VENDOR LIST
          ListView.builder(

            shrinkWrap: true,

            physics:
                const NeverScrollableScrollPhysics(),

            itemCount: vendors.length,

            itemBuilder: (context, index) {

              final vendor =
                  vendors[index];

              return InkWell(

                onTap: () {

                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (_) =>
                          VendorDetailScreen(
                        vendor: vendor,
                      ),
                    ),
                  );
                },

                child: Container(

                  margin:
                      const EdgeInsets.only(
                    bottom: 16,
                  ),

                  padding:
                      const EdgeInsets.all(16),

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                        BorderRadius.circular(
                            18),

                    boxShadow: [

                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.05),
                        blurRadius: 10,
                      )
                    ],
                  ),

                  child: Row(

                    children: [

                      Container(

                        width: 90,
                        height: 90,

                        decoration:
                            BoxDecoration(

                          color:
                              Colors.pink
                                  .shade100,

                          borderRadius:
                              BorderRadius
                                  .circular(
                                      16),
                        ),

                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.pink,
                          size: 40,
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(

                        child: Column(

                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          children: [

                            Text(
                              vendor['name']
                                  .toString(),

                              style:
                                  const TextStyle(
                                fontSize: 18,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),

                            const SizedBox(
                                height: 8),

                            Text(
                              '⭐ ${vendor['rating']}',
                            ),

                            const SizedBox(
                                height: 8),

                            Text(
                              vendor['price']
                                  .toString(),

                              style:
                                  const TextStyle(
                                color:
                                    Colors.pink,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}