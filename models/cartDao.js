const appDataSource = require('./dataSource');

const createCart = async (userId, productOptionId) => {
  console.log(userId, productOptionId);
  const result = await appDataSource.query(`
    INSERT INTO carts (
      user_id,
      product_option_id
    ) VALUES (?, ?)`, 
    [userId, productOptionId]
  );
  return result;
}

module.exports = {
  createCart
}