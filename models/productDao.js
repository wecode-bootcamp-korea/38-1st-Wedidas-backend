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

const getCategoryAllProducts = async (gender, category, offset, limit) => {
  try{
  return await database.query(`
    SELECT
        p.id,
        p.name,
        p.price,
        p.thumbnail_image_url AS thumbnailUrl,
        mc.name AS gender,
        sc.name AS category
    FROM products AS p
    INNER JOIN sub_categories AS sc ON p.sub_category_id = sc.id
    INNER JOIN main_categories AS mc ON sc.main_category_id = mc.id
    WHERE mc.name = '${gender}' ${category} LIMIT ${offset},${limit}`
    );
  }
catch (err) {
  const error = new Error(err.message);
  error.statusCode = 500;
  throw error;
}
}

module.exports = {
  getProducts,
  getCategoryAllProducts
};
