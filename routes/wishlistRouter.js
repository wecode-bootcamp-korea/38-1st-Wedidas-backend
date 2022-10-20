const express = require('express');
const wishlistController = require('../controllers/wishlistController');

const router = express.Router();

router.post('', wishlistController.createWishlist);
router.get('/:userId', wishlistController.getWishlist);
router.delete('/:userId/:productId', wishlistController.deleteWishlist);

module.exports = router;