const cartService = require('../services/cartService');
const { catchAsync } = require('../utils/error');

const createCart = catchAsync(async (req, res) => {
  const userId = req.user.id;
  const { productId, sizeId } = req.body;

  if ( !productId || !sizeId ) {
    const error = new Error('KEY_ERROR');
    error.statusCode = 400;
    throw error;
  }

  await cartService.createCart(userId, productId, sizeId);
  res.status(201).json({ message: 'SUCCESS' });
});

const getCartByUserId = catchAsync(async (req, res) => {
  const userId = req.user.id;

  const selectedCart  = await cartService.getCartByUserId(userId);
  res.status(200).json({ selectedCart });
})

const updateCart = catchAsync(async (req, res) => {
  const userId = req.user.id;
  const { cartId, count, stock } = req.query;

  if ( !cartId || !count || !stock) {
    const error = new Error('KEY_ERROR');
    error.statusCode = 400;
    throw error;
  }

  await cartService.updateCart(userId, cartId, count, stock);
  res.status(200).json({ message: 'SUCCESS' });
})

const deleteCart = catchAsync(async (req, res) => {
  const userId = req.user.id;
  const { cartId } = req.query;

  if ( !cartId) {
    const error = new Error('KEY_ERROR');
    error.statusCode = 400;
    throw error;
  }

  await cartService.deleteCart(userId, cartId);
  res.status(204).end();
  // res.status(204).send();
})

module.exports = {
  createCart,
  getCartByUserId,
  updateCart,
  deleteCart
}