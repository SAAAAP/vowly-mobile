import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() =>
      _CartScreenState();
}

class _CartScreenState
    extends State<CartScreen> {

  int quantity = 1;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFFDF8F8),

      appBar: AppBar(

        title: const Text(
          'Keranjang',
        ),

        centerTitle: true,

        backgroundColor: Colors.white,

        elevation: 0,

        foregroundColor: Colors.black,
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            /// CART ITEM
            Container(

              padding:
                  const EdgeInsets.all(16),

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius:
                    BorderRadius.circular(20),

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

                    decoration: BoxDecoration(

                      color:
                          Colors.pink.shade100,

                      borderRadius:
                          BorderRadius
                              .circular(16),
                    ),

                    child: const Icon(
                      Icons.photo_camera,
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

                        const Text(
                          'Light Capture',
                          style: TextStyle(
                            fontWeight:
                                FontWeight
                                    .bold,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 6),

                        const Text(
                          'Paket Standard',
                        ),

                        const SizedBox(height: 12),

                        Text(
                          'Rp 6.500.000',
                          style: TextStyle(
                            color: Colors
                                .green.shade700,
                            fontWeight:
                                FontWeight
                                    .bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// DEAL INFO
            Container(

              padding:
                  const EdgeInsets.all(16),

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius:
                    BorderRadius.circular(20),

                boxShadow: [

                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.05),
                    blurRadius: 10,
                  )
                ],
              ),

              child: Column(

                children: [

                  Row(

                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                    children: [

                      const Text(
                        'Harga Awal',
                      ),

                      Text(
                        'Rp 7.500.000',
                        style: TextStyle(
                          color:
                              Colors.grey
                                  .shade600,
                          decoration:
                              TextDecoration
                                  .lineThrough,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 12),

                  const Row(

                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                    children: [

                      Text(
                        'Harga Deal',
                      ),

                      Text(
                        'Rp 6.500.000',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(

                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                    children: [

                      const Text(
                        'Admin Fee (3%)',
                      ),

                      Text(
                        'Rp 195.000',
                        style: TextStyle(
                          color:
                              Colors.grey
                                  .shade700,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            const Spacer(),

            /// TOTAL
            Container(

              padding:
                  const EdgeInsets.all(20),

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius:
                    BorderRadius.circular(24),

                boxShadow: [

                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.05),
                    blurRadius: 10,
                  )
                ],
              ),

              child: Column(

                children: [

                  const Row(

                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                    children: [

                      Text(
                        'Total Pembayaran',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),

                      Text(
                        'Rp 6.695.000',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 20),

                  SizedBox(

                    width: double.infinity,

                    child: ElevatedButton(

                      style:
                          ElevatedButton.styleFrom(

                        backgroundColor:
                            Colors.pink,

                        padding:
                            const EdgeInsets
                                .symmetric(
                          vertical: 16,
                        ),

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius
                                  .circular(16),
                        ),
                      ),

                      onPressed: () {},

                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
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