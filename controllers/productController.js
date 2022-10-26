const productService = require('../services/productService');
const { catchAsync } = require('../utils/error');

const getProducts = catchAsync(async (req, res) => {   
    const offset = req.query.offset;
    const limit = req.query.limit;
    const gender = req.query.gender;

    const products = await productService.getProducts(offset, limit, gender);
    
    res.status(200).json({ data : products });
});

const getProductDetails = catchAsync(async (req, res) => {
    let productId = parseInt(req.params.productId);
    const detail = await productService.getProductDetailsByProductId(productId)

    return res.status(200).json({ data : detail });
})

module.exports = {
    getProducts,
    getProductDetails
}