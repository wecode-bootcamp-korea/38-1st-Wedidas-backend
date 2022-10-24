const express = require('express');
const cartRouter = require('../controllers/cartController');
const { loginRequired } = require('../utils/auth');

const router = express.Router();

router.post('', loginRequired, cartRouter.createCart);
router.get('', loginRequired, cartRouter.getCart);
router.delete('', loginRequired, cartRouter.deleteCart);

module.exports = router;