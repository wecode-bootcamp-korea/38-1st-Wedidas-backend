const cartService = require('../services/cartService');
const { catchAsync } = require('../utils/error');

const createCart = catchAsync(async (req, res) => {
  const userId = req.user.id;
  const { productId, sizeId } = req.body;

  if ( !userId || !productId || !sizeId ) {
    const error = new Error('KEY_ERROR');
    error.statusCode = 400;
    throw error;
  }
  const insertCart = await cartService.createCart(userId, productId, sizeId);
  res.status(201).json({ insertId : insertCart.insertId });
});

const getCart = catchAsync(async (req, res) => {
  const userId = req.user.id;

  if ( !userId ) {
    const error = new Error('KEY_ERROR');
    error.statusCode = 400;
    throw error;
  }

  const selectCart = await cartService.getCart(userId);
  res.status(200).json({ selectCart });
})

const deleteCart = catchAsync(async (req, res) => {
  const userId = req.user.id;
  const { productId, sizeId } = req.query;

  if ( !userId || !productId || !sizeId) {
    const error = new Error('KEY_ERROR');
    error.statusCode = 400;
    throw error;
  }

  await cartService.deleteCart(userId, productId, sizeId);
  res.status(204).end();
})

module.exports = {
  createCart,
  getCart,
  deleteCart
}

