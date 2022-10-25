const database = require("./dataSource");

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

const productDetails = async (productId) => {
   try{
    return await database.query(`
        SELECT DISTINCT
        p.id,
        p.name AS name,
        p.description AS description,
        p.thumbnail_image_url AS thumbnail,
        si.stocksize AS stocksize,
        sc.name AS category,
        mc.name AS gender,
        JSON_ARRAY(pi.image_url) AS imageUrl
      FROM products AS p
      LEFT JOIN product_options AS po ON p.id = po.product_id
      LEFT JOIN product_images AS pi ON pi.product_id = p.id
      LEFT JOIN sub_categories AS sc ON sc.id = p.sub_category_id
      LEFT JOIN main_categories AS mc ON mc.id = sc.main_category_id 
      LEFT JOIN (       
        SELECT          
        po.id,           
        JSON_ARRAYAGG(             
          JSON_OBJECT(  
            "sizeId", size_id,                            
            "size", foot_size,
            "stock", po.stock
            )           
            ) AS stocksize        
            FROM sizes
            INNER JOIN product_options AS po ON po.size_id=sizes.id
            GROUP BY po.id     
        ) AS si ON po.size_id = si.id
        WHERE p.id=?
    ` , [productId]);
   }  

   catch (err) {
    const error = new Error(err.message);
    error.statusCode = 500;
    throw error;
  }
}

module.exports = {
  getProducts,
  productDetails
};
