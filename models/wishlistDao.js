const appDataSource = require('./dataSource');

const createWishlist = async (userId, productId) => {
  const result = await appDataSource.query(`
    INSERT INTO wishlists (
      user_id,
      product_id
    ) VALUES (?, ?)`,
    [userId, productId]
  );

  return result.insertId;
}

const getWishlist = async (userId) => {
  const result = await appDataSource.query(`
  SELECT
    w.user_id AS id,
    p.name,  
    p.price,
    p.thumbnail_image_url
  FROM wishlists w
  JOIN users u ON w.user_id = u.id
  JOIN products p ON w.product_id = p.id
  WHERE u.id = ?
  `, 
  [userId]
  );

  return result;
}

const deleteWishlist = async (userId, productId) => {
  const deleteRows = await appDataSource.query(`
    DELETE FROM wishlists
    WHERE user_id=? AND product_id=?`,
    [userId, productId]
  );

  return deleteRows;
}

module.exports = {
  createWishlist,
  getWishlist,
  deleteWishlist
}