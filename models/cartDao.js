const appDataSource = require('./dataSource');

const getProductOptionIdUsedInCart = async (productId, sizeId) => {
  const productOptionId = await appDataSource.query(`
    SELECT
      po.id
    FROM product_options po
    WHERE po.product_id = ? AND po.sizeId = ?
  `, [productId, sizeId])
  return productOptionId
}

const createCart = async (userId) => {
  const insertCart = await appDataSource.query(`
    INSERT INTO carts(
      user_id,
      product_option_id
    ) 
    SELECT ${userId}, ${productOptionId}
    WHERE NOT EXISTS(
      SELECT id FROM carts
      WHERE user_id=${userId} AND product_option_id=${productOptionId} 
    )
  `)

  if (insertCart.affectedRows === 0) {
    const error = new Error('FAILED');
    error.statusCode = 400;
    throw error;
  }
  return insertCart;
}

const getCartByUserId = async (userId) => {
  const result = await appDataSource.query(`
    SELECT
      c.id,
      c.user_id AS userId,
      c.product_option_id AS productOptionId,
      c.count,
      po.product_id AS productId,
      po.size_id AS sizeId,
      po.stock
      JSON_OBJECT(
        'id', p.id,
        'name', p.name,
        'price', p.price,
        'thumbnailUrl', p.thumbnail_image_url
      ) as products,
      s.foot_size AS footSize
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

const updateCart = async (userId, cartId, count, stock) => {
  const result = await appDataSource.query(`
    UPDATE
      carts AS c
    SET count=${count}
    WHERE c.id=${cartId}
    AND c.user_id=${userId}
    AND ${count} <= ${stock}
  `);

  if (result.affectedRows === 0) {
    const error = new Error('FAILED');
    error.statusCode = 400;
    throw error;
  }

  return result;
}

const deleteCart = async (userId, cartId) => {
  const result = await appDataSource.query(`
    DELETE
    FROM carts
    WHERE user_id=? AND id=?`,
  [userId, cartId]
  );
  return result;
}

module.exports = {
  getProductOptionIdUsedInCart,
  createCart,
  getCartByUserId,
  updateCart,
  deleteCart
}