const database = require("./dataSource");

const getProducts = async (sortPrice, size, offset, limit, gender) => {
  try {
    const numberOffset = +offset;
    const numberLimit = +limit;
    let priceSort = '';

    if(sortPrice === 'high'){
      priceSort = 'p.price desc'
    }else if(sortPrice === 'low'){ 
      priceSort = 'p.price'
    }else if(sortPrice === undefined){
      priceSort = 'p.id'
    }    

    return await database.query(`
       SELECT
        DISTINCT
          p.id,
          p.name,
          p.price,
          p.thumbnail_image_url AS thumbnailUrl,
          mc.name AS gender,
          sc.name AS category
       FROM products AS p
       INNER JOIN sub_categories AS sc ON p.sub_category_id = sc.id
       INNER JOIN main_categories AS mc ON sc.main_category_id = mc.id
       WHERE mc.name = ? 
       ORDER BY ${priceSort}
       LIMIT ?,?
       `, [gender, numberOffset, numberLimit]
    );
  } catch (err) {
    const error = new Error(err.message);
    error.statusCode = 500;
    throw error;
  }
};

module.exports = {
  getProducts,
};
