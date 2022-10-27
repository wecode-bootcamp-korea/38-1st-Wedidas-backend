const productDao = require('../models/productDao');

const getProductsByGender = async (sort, category, offset, limit, gender) => {
    return await productDao.getProductsByGender(sort, category, offset, limit, gender);
};

module.exports = {
  getProductsByGender
}