import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() =>
      _ChatScreenState();
}

class _ChatScreenState
    extends State<ChatScreen> {

  final TextEditingController
      messageController =
      TextEditingController();

  final List<Map<String, dynamic>>
      messages = [

    {
      'isMe': false,
      'message':
          'Halo kak, apakah masih available untuk wedding bulan Mei?',
      'time': '10:01'
    },

    {
      'isMe': true,
      'message':
          'Halo kak 😊 masih available',
      'time': '10:02'
    },

    {
      'isMe': false,
      'message':
          'Apakah bisa nego untuk paket standard?',
      'time': '10:03'
    },

  ];

  void sendMessage() {

    if (messageController.text.isEmpty) {
      return;
    }

    setState(() {

      messages.add({

        'isMe': true,
        'message':
            messageController.text,

        'time': '10:10'
      });

    });

    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFFDF8F8),

      appBar: AppBar(

        elevation: 0,

        backgroundColor: Colors.white,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),

        title: Row(

          children: [

            CircleAvatar(
              backgroundColor:
                  Colors.pink.shade100,
              child: const Icon(
                Icons.store,
                color: Colors.pink,
              ),
            ),

            const SizedBox(width: 12),

            const Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  'Light Capture',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                SizedBox(height: 2),

                Text(
                  'Online',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),

        actions: [

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          )
        ],
      ),

      body: Column(

        children: [

          /// CHAT LIST
          Expanded(

            child: ListView.builder(

              padding:
                  const EdgeInsets.all(16),

              itemCount: messages.length,

              itemBuilder:
                  (context, index) {

                final chat =
                    messages[index];

                final isMe =
                    chat['isMe'];

                return Align(

                  alignment: isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,

                  child: Container(

                    constraints:
                        const BoxConstraints(
                      maxWidth: 280,
                    ),

                    margin:
                        const EdgeInsets.only(
                      bottom: 12,
                    ),

                    padding:
                        const EdgeInsets.all(14),

                    decoration:
                        BoxDecoration(

                      color: isMe
                          ? Colors.pink
                          : Colors.white,

                      borderRadius:
                          BorderRadius.only(

                        topLeft:
                            const Radius.circular(
                          16,
                        ),

                        topRight:
                            const Radius.circular(
                          16,
                        ),

                        bottomLeft:
                            Radius.circular(
                          isMe ? 16 : 0,
                        ),

                        bottomRight:
                            Radius.circular(
                          isMe ? 0 : 16,
                        ),
                      ),

                      boxShadow: [

                        BoxShadow(
                          color:
                              Colors.black
                                  .withOpacity(
                            0.05,
                          ),
                          blurRadius: 5,
                        )
                      ],
                    ),

                    child: Column(

                      crossAxisAlignment:
                          CrossAxisAlignment
                              .end,

                      children: [

                        Text(
                          chat['message'],
                          style: TextStyle(
                            color: isMe
                                ? Colors.white
                                : Colors.black87,
                            fontSize: 14,
                          ),
                        ),

                        const SizedBox(
                            height: 6),

                        Text(
                          chat['time'],
                          style: TextStyle(
                            color: isMe
                                ? Colors.white70
                                : Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          /// NEGOTIATION CARD
          Container(

            margin:
                const EdgeInsets.symmetric(
              horizontal: 16,
            ),

            padding:
                const EdgeInsets.all(16),

            decoration: BoxDecoration(

              color: Colors.white,

              borderRadius:
                  BorderRadius.circular(16),

              boxShadow: [

                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.05),
                  blurRadius: 5,
                )
              ],
            ),

            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                const Text(
                  'Penawaran Harga',
                  style: TextStyle(
                    fontWeight:
                        FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 12),

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
                        decoration:
                            TextDecoration
                                .lineThrough,
                        color:
                            Colors.grey.shade600,
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 8),

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

                const SizedBox(height: 16),

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
                        vertical: 14,
                      ),
                    ),

                    onPressed: () {},

                    child: const Text(
                      'Tambahkan ke Keranjang',
                    ),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 12),

          /// INPUT CHAT
          Container(

            padding:
                const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),

            color: Colors.white,

            child: Row(

              children: [

                Expanded(

                  child: TextField(

                    controller:
                        messageController,

                    decoration:
                        InputDecoration(

                      hintText:
                          'Ketik pesan...',

                      filled: true,

                      fillColor:
                          Colors.grey.shade100,

                      border:
                          OutlineInputBorder(

                        borderRadius:
                            BorderRadius
                                .circular(30),

                        borderSide:
                            BorderSide.none,
                      ),

                      contentPadding:
                          const EdgeInsets
                              .symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                GestureDetector(

                  onTap: sendMessage,

                  child: Container(

                    width: 52,
                    height: 52,

                    decoration:
                        const BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}