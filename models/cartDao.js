const appDataSource = require('./dataSource');

const createCart = async (userId, productOptionId) => {
  const result = await appDataSource.query(`
    INSERT INTO carts (
      user_id,
      product_option_id
    ) VALUES (?, ?)`, 
    [userId, productOptionId]
  );
  return result;
}

const getCart = async (userId) => {
  const result = await appDataSource.query(`
    SELECT
      c.user_id AS id,
      c.product_option_id AS productOptionId,
      c.count,
      p.thumbnail_image_url AS thumbnailUrl,
      p.name,
      s.foot_size AS footSize,
      po.stock
    FROM carts c
    JOIN users u ON c.user_id = u.id
    JOIN product_options po ON c.product_option_id = po.id
    JOIN products p ON po.product_id = p.id
    JOIN sizes s ON po.size_id = s.id
    WHERE u.id = ?`,
    [userId]
  );
  return result;
}

module.exports = {
  createCart,
  getCart
}