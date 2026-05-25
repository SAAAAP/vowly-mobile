const express = require('express');

const router = express.Router();

const favoriteController = require('../controllers/favoriteController');

router.post('/', favoriteController.addFavoriteVendor);
router.get('/:brideId', favoriteController.getFavoriteVendors);

module.exports = router;