const productDao = require('../models/productDao');

const getProducts = async (sortPrice, size, offset, limit, gender) => {
    return await productDao.getProducts(sortPrice, size, offset, limit, gender);
};

module.exports = {
    getProducts
}