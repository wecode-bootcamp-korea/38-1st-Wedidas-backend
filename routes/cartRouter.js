const express = require('express');
const cartRouter = require('../controllers/cartController');

const router = express.Router();

router.post('', cartRouter.createCart);
router.get('', cartRouter.getCart);
router.delete('', cartRouter.deleteCart);

module.exports = router;