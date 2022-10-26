const cartDao = require('../models/cartDao');

const createCart = async (userId, productId, sizeId) => {
  const productOptionId = await cartDao.getProductOptionIdUsedInCart(productId, sizeId)

  return await cartDao.createCart(userId, productOptionId);
}

const getCartByUserId = async (userId) => {
  return await cartDao.getCartByUserId(userId);
}

const updateCart = async (userId, cartId, count, stock) => {
  return await cartDao.updateCart(userId, cartId, count, stock);
}

const deleteCart = async (userId, cartId) => {
  return await cartDao.deleteCart(userId, cartId);
}

module.exports = {
  createCart,
  getCartByUserId,
  updateCart,
  deleteCart
}