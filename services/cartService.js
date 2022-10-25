const cartDao = require('../models/cartDao');

const createCart = async (userId, productId, sizeId) => {
  return await cartDao.createCart(userId, productId, sizeId);
}

const getCart = async (userId) => {
  return await cartDao.getCart(userId);
}

const updateCart = async (userId, count, stock) => {
  return await cartDao.updateCart(userId, count, stock);
}

const deleteCart = async (userId, productId, sizeId) => {
  return await cartDao.deleteCart(userId, productId, sizeId);
}

module.exports = {
  createCart,
  getCart,
  updateCart,
  deleteCart
}