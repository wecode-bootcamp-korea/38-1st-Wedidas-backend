const wishlistDao = require('../models/wishlistDao');

const createWishlist = async (userId, productId) => {
  return await wishlistDao.createWishlist(userId, productId);
}

const getWishlist = async (userId) => {
  return await wishlistDao.getWishlist(userId);
}

const deleteWishlist = async (userId, productId) => {
  return await wishlistDao.deleteWishlist(userId, productId);
}

module.exports = {
  createWishlist,
  getWishlist,
  deleteWishlist
}