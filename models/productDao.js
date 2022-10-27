const database = require("./dataSource");

const getProductsByGender = async (sort, offset, limit, gender) => {

  function orderBy(sort) {
    const sortSet = {
      old:  'p.id',
      new:  'p.id desc',
      high: 'p.price desc',
      low:  'p.price'
    }
    return sort ? sortSet[sort] : 'p.id'
  }

  try {
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
       ORDER BY ${orderBy(sort)}
       LIMIT ?,?
       `, [gender, offset, limit]
    );
  } catch (err) {
    const error = new Error(err.message);
    error.statusCode = 500;
    throw error;
  }
};

module.exports = {
  getProductsByGender
};