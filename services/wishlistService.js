const wishlistDao = require('../models/wishlistDao');

const createWishlist = async (userId, productId) => {
  
  const affectedRows = await wishlistDao.createWishlist(userId, productId);

  if (!affectedRows) {
    const error = new Error('이미 위시리스트에 존재하는 상품입니다.');
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