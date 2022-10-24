const productDao = require('../models/productDao');

const trimData = async (productId) => {
    const data = await productDao.productDetail(productId);
    const url = await productDao.imageUrl(productId);
    
    const imageArray = []

    for(let i=0; i<url.length; i++){
        imageArray.push(url[i].imageUrl)
    }
    for(let i=0; i<data.length; i++){
        
    }
console.log(data)
    return data;
}

const getProducts = async (offset, limit, gender) => {
    return await productDao.getProducts(offset, limit, gender);
};
const productDetails = async (gender, category, productId) => {
    return await productDao.productDetails(gender, category, productId);
}

module.exports = {
    getProducts,
    productDetails,
    trimData
}