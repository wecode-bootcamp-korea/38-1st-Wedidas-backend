const database = require("./dataSource");

const getProducts = async (offset, limit, gender) => {
  try {
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
       WHERE mc.name = ? AND p.id LIMIT ?,?`, [gender, offset, limit]
    );
  } catch (err) {
    const error = new Error(err.message);
    error.statusCode = 500;
    throw error;
  }
};

const getProductDetailsByProductId = async (productId) => {
   try{
    return await database.query(`
      SELECT
      p.id,
      p.name,
      p.price,
      p.thumbnail_image_url AS thumbnailUrl,
      mc.name AS gender,
      sc.name AS category,
      JSON_ARRAYAGG(pi.image_url) AS images,
      (	
        SELECT
          JSON_ARRAYAGG(
            JSON_OBJECT(
              'id', po.id,
              'footSize', s.foot_size,
              'stock', po.stock
          )
        )
        FROM product_options AS po
          INNER JOIN sizes AS s ON s.id = po.size_id
          WHERE po.product_id = p.id
      ) AS stocksize
      FROM products p
      LEFT JOIN product_images pi ON pi.product_id = p.id
      LEFT JOIN sub_categories sc ON sc.id = p.sub_category_id
      LEFT JOIN main_categories mc ON mc.id = sc.main_category_id
      WHERE p.id = ?` , [productId]);
   }  

   catch (err) {
    const error = new Error(err.message);
    error.statusCode = 500;
    throw error;
  }
}

module.exports = {
  getProducts,
  getProductDetailsByProductId
};