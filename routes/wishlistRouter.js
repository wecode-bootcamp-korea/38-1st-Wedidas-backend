const express = require('express');
const wishlistController = require('../controllers/wishlistController');
const { loginRequired } = require('../utils/auth');

const router = express.Router();

router.post('', loginRequired, wishlistController.createWishlist);
router.get('', loginRequired, wishlistController.getWishlist);
router.delete('', loginRequired, wishlistController.deleteWishlist);

module.exports = router;