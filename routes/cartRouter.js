const express = require('express');
const cartRouter = require('../controllers/cartController');

const router = express.Router();

router.post('', cartRouter.createCart);

module.exports = router;