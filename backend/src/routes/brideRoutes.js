const express = require('express');

const router = express.Router();

const brideController = require('../controllers/brideController');

router.get('/:id', brideController.getBrideProfile);
router.put('/:id', brideController.updateBrideProfile);

module.exports = router;