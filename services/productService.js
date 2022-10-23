const productDao = require('../models/productDao');

const getProducts = async (sort, size, offset, limit, gender) => {
    return await productDao.getProducts(sort, size, offset, limit, gender);
};

module.exports = {
    getProducts
}