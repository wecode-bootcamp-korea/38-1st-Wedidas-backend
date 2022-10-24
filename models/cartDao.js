const appDataSource = require('./dataSource');

const createCart = async (userId, productId, sizeId) => {
  const selectCart = await appDataSource.query(`
    SELECT
      c.count,
      c.user_id,
      po.stock,
      po.id
    FROM carts AS c
    JOIN users AS u ON c.user_id = u.id
    JOIN product_options AS po ON c.product_option_id = po.id
    JOIN products AS p ON po.product_id = p.id
    JOIN sizes AS s ON po.size_id = s.id
    WHERE c.user_id=? AND po.product_id=? AND po.size_id=?`,
    [userId, productId, sizeId]
  );
  if (selectCart[0].count < 1) {
    const insertCart = await appDataSource.query(`
    INSERT INTO carts (
      user_id,
      product_option_id
    ) VALUES (?, (SELECT po.id FROM product_options AS po
      JOIN products AS p ON po.product_id = p.id
      JOIN sizes AS s ON po.size_id = s.id
      WHERE po.product_id=? AND po.size_id=?))`, 
    [userId, productId, sizeId]
  );
  return insertCart;
  } else if (selectCart[0].count < selectCart[0].stock) {
    const updateCart = await appDataSource.query(`
      UPDATE carts SET count=${selectCart[0].count}+1 WHERE user_id=? AND ${selectCart[0].id}
    `,[userId]
  );
  return updateCart;
  } else {
    const error = new Error('Out of stock');
    error.statusCode = 400;
    throw error;
  }
}


const getCart = async (userId) => {
  const result = await appDataSource.query(`
    SELECT
      c.user_id AS userId,
      c.product_option_id AS productOptionId,
      c.count,
      po.product_id AS productId,
      po.size_id AS sizeId,
      p.thumbnail_image_url AS thumbnailUrl,
      p.name,
      p.price,
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