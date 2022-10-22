const cartDao = require('../models/cartDao');

const createCart = async (userId, productOptionId) => {
  return await cartDao.createCart(userId, productOptionId);
}

module.exports = {
  createCart
}