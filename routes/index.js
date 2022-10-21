const router = require('express').Router();

const productRouter = require('./productRouter');
const userRouter = require('./userRouter');

router.use('/products', productRouter);
router.use('/users', userRouter);

module.exports = router;