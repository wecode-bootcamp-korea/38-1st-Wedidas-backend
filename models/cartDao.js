const appDataSource = require('./dataSource');

const createCart = async (userId, productId, sizeId) => {
  const result = await appDataSource.query(`
    INSERT INTO carts (
      user_id,
      product_option_id
    ) VALUES (?, (SELECT po.id FROM product_options AS po
      JOIN products AS p ON po.product_id = p.id
      JOIN sizes AS s ON po.size_id = s.id
      WHERE po.product_id=? AND po.size_id=?))`, 
    [userId, productId, sizeId]
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
    FROM carts AS c
    JOIN users AS u ON c.user_id = u.id
    JOIN product_options AS po ON c.product_option_id = po.id
    JOIN products p ON po.product_id = p.id
    JOIN sizes AS s ON po.size_id = s.id
    WHERE c.user_id=?`,
    [userId]
  );
  return result;
}

const deleteCart = async (userId, productId, sizeId) => {
  const result = await appDataSource.query(`
    DELETE
    FROM carts
    WHERE user_id=? AND 
      product_option_id = (SELECT po.id FROM product_options AS po
        JOIN products AS p ON po.product_id = p.id
        JOIN sizes AS s ON po.size_id = s.id
        WHERE po.product_id=? AND po.size_id=?)`,
  [userId, productId, sizeId]
  );
  return result;
}

module.exports = {
  createCart,
  getCart,
  deleteCart
}