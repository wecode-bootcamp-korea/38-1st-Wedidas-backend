const wishlistDao = require('../models/wishlistDao');

const createWishlist = async (userId, productId) => {
  
  const affectedRows = await wishlistDao.createWishlist(userId, productId);

  if (!affectedRows) {
    const error = new Error('This product already exists!');
    error.statusCode = 400;
    throw error;
  }
  return affectedRows;
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