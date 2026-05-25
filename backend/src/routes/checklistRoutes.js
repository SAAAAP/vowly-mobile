const express = require('express');
const router = express.Router();

const checklistController = require('../controllers/checklistController');

router.post('/', checklistController.createChecklist);
router.get('/:brideId', checklistController.getChecklist);
router.put('/:id', checklistController.toggleChecklist);

module.exports = router;
