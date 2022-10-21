const router = require('express').Router();

const productRouter = require('./productRouter');
const userRouter = require('./userRouter');
const wishlistRouter = require('./wishlistRouter');

router.use('/products', productRouter);
router.use('/users', userRouter);
router.use('/wishlists', wishlistRouter);

module.exports = router;