const productDao = require('../models/productDao');

const getProducts = async (offset, limit, gender) => {
    return await productDao.getProducts(offset, limit, gender);
};

const getProductDetailsByProductId = async (productId) => {
    return await productDao.productDetails(productId);
}



module.exports = {
    getProducts,
    getProductDetailsByProductId
}