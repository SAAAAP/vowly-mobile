const path = require('path');
require('dotenv').config({ path: path.resolve(__dirname, '../.env') });

console.log('JWT SECRET:', process.env.JWT_SECRET);

const express = require('express');
const cors = require('cors');

const prisma = require('./config/db');

const app = express();

const authRoutes = require('./routes/authRoutes');

const vendorRoutes = require('./routes/vendorRoutes');

const brideRoutes = require('./routes/brideRoutes');
const favoriteRoutes = require('./routes/favoriteRoutes');
const checklistRoutes = require('./routes/checklistRoutes');

const http = require('http');
const { Server } = require('socket.io');

app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use('/api/auth', authRoutes);
app.use('/api/vendors', vendorRoutes);

app.get('/', (req, res) => {
  res.json({
    message: 'Vowly Backend Running'
  });
});


// USERS
app.get('/users', async (req, res) => {
  try {
    const users = await prisma.user.findMany();

    res.json(users);
  } catch (error) {
    res.status(500).json({
      error: error.message
    });
  }
});


// VENDORS
app.get('/vendors', async (req, res) => {
  try {
    const vendors = await prisma.vendorProfile.findMany({
      include: {
        user: true,
        portfolios: true,
        packages: true
      }
    });

    res.json(vendors);
  } catch (error) {
    res.status(500).json({
      error: error.message
    });
  }
});


// BRIDE PROFILES
app.get('/brides', async (req, res) => {
  try {
    const brides = await prisma.brideProfile.findMany({
      include: {
        user: true
      }
    });

    res.json(brides);
  } catch (error) {
    res.status(500).json({
      error: error.message
    });
  }
});


// PACKAGES
app.get('/packages', async (req, res) => {
  try {
    const packages = await prisma.package.findMany();

    res.json(packages);
  } catch (error) {
    res.status(500).json({
      error: error.message
    });
  }
});


// BOOKINGS
app.get('/bookings', async (req, res) => {
  try {
    const bookings = await prisma.booking.findMany({
      include: {
        payment: true
      }
    });

    res.json(bookings);
  } catch (error) {
    res.status(500).json({
      error: error.message
    });
  }
});


// PAYMENTS
app.get('/payments', async (req, res) => {
  try {
    const payments = await prisma.payment.findMany();

    res.json(payments);
  } catch (error) {
    res.status(500).json({
      error: error.message
    });
  }
});


// CHATS
app.get('/chats', async (req, res) => {
  try {
    const chats = await prisma.chat.findMany({
      include: {
        messages: true
      }
    });

    res.json(chats);
  } catch (error) {
    res.status(500).json({
      error: error.message
    });
  }
});


// MESSAGES
app.get('/messages', async (req, res) => {
  try {
    const messages = await prisma.message.findMany();

    res.json(messages);
  } catch (error) {
    res.status(500).json({
      error: error.message
    });
  }
});

const PORT = process.env.PORT || 5000;

const startServer = async () => {
  try {
    await prisma.$connect();
    console.log('Database connected successfully');
    app.listen(PORT, () => {
      console.log(`Server running on port ${PORT}`);
    });
  } catch (error) {
    console.error('Failed to connect to database:', error.message);
    process.exit(1);
  }
};

process.on('SIGINT', async () => {
  await prisma.$disconnect();
  process.exit(0);
});


app.use('/api/brides', brideRoutes);
app.use('/api/favorites', favoriteRoutes);
app.use('/api/checklists', checklistRoutes);

app.use((req, res) => {
  res.status(404).json({
    error: 'Not Found',
    path: req.originalUrl
  });
});

startServer();