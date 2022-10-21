const productDao = require('../models/productDao');

const getProducts = async (offset, limit, gender) => {
    return await productDao.getProducts(offset, limit, gender);
};

module.exports = {
    getProducts
}