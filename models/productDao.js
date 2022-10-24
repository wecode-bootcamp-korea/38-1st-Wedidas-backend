const database = require("./dataSource");

const imageUrl = async (productId) => {
  return await database.query(`
    SELECT 
      pi.image_url AS image_url 
    FROM product_images AS pi
  `)
}

const getProducts = async (offset, limit, gender) => {
  try {
    const numberOffset = +offset;
    const numberLimit = +limit;
    return await database.query(`
       SELECT
          p.id,
          p.name,
          p.price,
          p.thumbnail_image_url AS thumbnail_url,
          mc.name AS gender,
          sc.name AS category
       FROM products AS p
       INNER JOIN sub_categories AS sc ON p.sub_category_id = sc.id
       INNER JOIN main_categories AS mc ON sc.main_category_id = mc.id
       WHERE mc.name = ? AND p.id LIMIT ?,?`, [gender, numberOffset, numberLimit]
    );
  } catch (err) {
    const error = new Error(err.message);
    error.statusCode = 500;
    throw error;
  }
};


const productDetails = async (gender, category, productId) => {
   try{
    return await database.query(`
      SELECT DISTINCT
        p.name AS name,
        p.description AS description,
        pi.image_url AS image,
        mc.name AS gender,
        sc.name AS category
      FROM products AS p 
      INNER JOIN product_options AS po ON p.id = po.product_id
      INNER JOIN product_images AS pi ON p.id = pi.product_id
      INNER JOIN sub_categories AS sc ON p.sub_category_id = sc.id
      INNER JOIN main_categories AS mc ON sc.main_category_id = mc.id
      WHERE mc.name = ? AND sc.name = ? AND p.id = ?
    ` , [gender, category, productId])
   }
   catch (err) {
    const error = new Error(err.message);
    error.statusCode = 500;
    throw error;
  }
}

module.exports = {
  getProducts,
  productDetails,
  imageUrl
};
