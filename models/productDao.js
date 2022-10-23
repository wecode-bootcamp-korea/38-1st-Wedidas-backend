const database = require("./dataSource");

const getProducts = async (sort, size, offset, limit, gender) => {
  try {
      const numberOffset = +offset; 
      const numberLimit = +limit;
    let sortValue = '';

    if(sort === 'high'){
      sortValue = 'p.price desc'
    }else if(sort === 'low'){ 
      sortValue = 'p.price'
    }else if(sort === 'new'){
      sortValue = 'p.id'
    }else if(sort === 'old'){
      sortValue = 'p.id desc'
    }else if(sort === undefined){
      sortValue = 'p.id'
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
       ORDER BY ${sortValue}
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
