const { UsingJoinColumnOnlyOnOneSideAllowedError } = require('typeorm');
const appDataSource = require('./dataSource');

const createCart = async (userId, productId, sizeId) => {
  const insertCart = await appDataSource.query(`
    INSERT INTO carts 
    (
      user_id,
      product_option_id
    ) 
    SELECT ${userId}, (SELECT po.id FROM product_options AS po
    JOIN products AS p ON po.product_id = p.id
    JOIN sizes AS s ON po.size_id = s.id
    WHERE po.product_id=${productId} AND po.size_id=${sizeId}) 
    WHERE NOT EXISTS
    (
      SELECT * FROM carts AS c 
      WHERE c.user_id=${userId} AND c.product_option_id= 
        (
          SELECT po.id FROM product_options AS po
          JOIN products AS p ON po.product_id = p.id
          JOIN sizes AS s ON po.size_id = s.id
          WHERE po.product_id=${productId} AND po.size_id=${sizeId}
        )  
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
      c.id AS cartId,
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

const updateCart = async (userId, cartId, count, stock) => {
  const result = await appDataSource.query(`
    UPDATE carts AS c, product_options AS po
    SET count=${count}
    WHERE c.id=${cartId} AND c.user_id=${userId} AND po.stock=${stock} AND ${count} <= ${stock}
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
  createCart,
  getCartByUserId,
  updateCart,
  deleteCart
}