const server = http.createServer(app);

const io = new Server(server, {
  cors: {
    origin: '*'
  }
});

io.on('connection', (socket) => {

  console.log('User connected');

  socket.on('send_message', (data) => {

    io.emit('receive_message', data);

  });

});

server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});