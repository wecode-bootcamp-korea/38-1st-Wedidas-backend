const cartDao = require('../models/cartDao');

const createCart = async (userId, productOptionId) => {
  return await cartDao.createCart(userId, productOptionId);
}

const getCart = async (userId) => {
  return await cartDao.getCart(userId);
}

module.exports = {
  createCart,
  getCart
}