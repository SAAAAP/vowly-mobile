const express = require('express');

const router = express.Router();

const authController = require('../controllers/authController');

router.route('/register')
  .get((req, res) => {
    res.status(405).json({
      message: 'Use POST /api/auth/register to create a new user'
    });
  })
  .post(authController.register);

router.route('/login')
  .get((req, res) => {
    res.status(405).json({
      message: 'Use POST /api/auth/login to authenticate'
    });
  })
  .post(authController.login);

module.exports = router;