const cartDao = require('../models/cartDao');

const createCart = async (userId, productId, sizeId) => {
  return await cartDao.createCart(userId, productId, sizeId);
}

const getCartByUserId = async (userId) => {
  return await cartDao.getCartByUserId(userId);
}

const updateCart = async (userId, cartId, quantity, stock) => {
  return await cartDao.updateCart(userId, cartId, quantity, stock);
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