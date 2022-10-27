const productDao = require('../models/productDao');

const getProductsByGender = async (sort, offset, limit, gender) => {
    return await productDao.getProductsByGender(sort, offset, limit, gender);
};

module.exports = {
  getProductsByGender
}