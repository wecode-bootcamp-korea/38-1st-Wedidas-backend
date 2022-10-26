const wishlistDao = require('../models/wishlistDao');

const createWishlist = async (userId, productId) => {
  return await wishlistDao.createWishlist(userId, productId);
}

const getWishlistByUserId = async (userId) => {
  return await wishlistDao.getWishlistByUserId(userId);
}

const deleteWishlist = async (userId, productId) => {
  return await wishlistDao.deleteWishlist(userId, productId);
}

module.exports = {
  createWishlist,
  getWishlistByUserId,
  deleteWishlist
}