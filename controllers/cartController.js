const cartService = require('../services/cartService');
const { catchAsync } = require('../utils/error');

const createCart = catchAsync(async (req, res) => {
  const userId = req.query.id;
  const { productOptionId } = req.body;

  if ( !userId || !productOptionId ) {
    const error = new Error('KEY_ERROR');
    error.statusCode = 400;
    throw error;
  }
  const insertCart = await cartService.createCart(userId, productOptionId);
  res.status(201).json({ insertId : insertCart.insertId });
});

const getCart = catchAsync(async (req, res) => {
  const { userId } = req.query;

  if ( !userId ) {
    const error = new Error('KEY_ERROR');
    error.statusCode = 400;
    throw error;
  }

  const selectCart = await cartService.getCart(userId);
  res.status(200).json({ selectCart });
})

module.exports = {
  createCart,
  getCart
}

