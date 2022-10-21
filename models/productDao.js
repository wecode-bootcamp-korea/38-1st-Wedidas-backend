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
       FROM products p
       INNER JOIN sub_categories sc ON p.sub_category_id = sc.id
       INNER JOIN main_categories mc ON sc.main_category_id = mc.id
       WHERE mc.name = ? AND p.id LIMIT ?,?`, [gender, numberOffset, numberLimit]
    );
  } catch (err) {
    const error = new Error("INVALID_DATA_INPUT");
    error.statusCode = 500;
    throw error;
  }
};

module.exports = {
  getProducts,
};
