const productDao = require('../models/productDao');

const getProductsByGender = async (sort, offset, limit, gender) => {
    return await productDao.getProductsByGender(sort, offset, limit, gender);
};

const getProductDetailsByProductId = async (productId) => {
    return await productDao.getProductDetailsByProductId(productId);
}



module.exports = {
    getProductsByGender,
    getProductDetailsByProductId
}