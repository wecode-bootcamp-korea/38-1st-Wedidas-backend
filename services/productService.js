const { CustomRepositoryCannotInheritRepositoryError } = require('typeorm');
const productDao = require('../models/productDao');

const getProducts = async (offset, limit, gender) => {
    return await productDao.getProducts(offset, limit, gender);
};

const getCategoryAllProducts = async (gender, category, offset, limit) => {      
    return await productDao.getCategoryAllProducts(gender, category, offset, limit);
}

module.exports = {
    getProducts,
    getCategoryAllProducts
}