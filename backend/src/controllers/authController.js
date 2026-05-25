const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const prisma = require('../config/db');

exports.register = async (req, res) => {

  try {

    const {
      name,
      email,
      password,
      role
    } = req.body;

    const existingUser = await prisma.user.findUnique({
      where: { email }
    });

    if (existingUser) {

      return res.status(400).json({
        message: 'Email already exists'
      });

    }

    const hashedPassword = await bcrypt.hash(
      password,
      10
    );

    const user = await prisma.user.create({
      data: {
        name,
        email,
        password: hashedPassword,
        role
      }
    });

    const { password: _, ...userWithoutPassword } = user;

    res.json({
      message: 'Register success',
      user: userWithoutPassword
    });

  } catch (error) {
    console.error('[Register Error]', error.message);
    res.status(500).json({
      error: error.message
    });

  }

};


exports.login = async (req, res) => {

  try {

    const {
      email,
      password
    } = req.body;

    const user = await prisma.user.findUnique({
      where: {
        email
      }
    });

    if (!user) {

      return res.status(404).json({
        message: 'User not found'
      });

    }

    const validPassword = await bcrypt.compare(
      password,
      user.password
    );

    if (!validPassword) {

      return res.status(400).json({
        message: 'Wrong password'
      });

    }

    const jwtSecret = process.env.JWT_SECRET || 'vowly_secret_key_dev';

    const token = jwt.sign(
      {
        id: user.id,
        role: user.role
      },
      jwtSecret,
      {
        expiresIn: '7d'
      }
    );

    const { password: _, ...userWithoutPassword } = user;

    res.json({
      message: 'Login success',
      token,
      user: userWithoutPassword
    });

  } catch (error) {
    console.error('[Login Error]', error.message);
    res.status(500).json({
      error: error.message
    });

  }

};