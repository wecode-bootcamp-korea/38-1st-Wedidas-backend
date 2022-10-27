const productService = require('../services/productService');
const { catchAsync } = require('../utils/error');

const getProductsByGender = catchAsync(async (req, res) => {   
    const { sort, offset, limit } = req.query;
    const { gender } = req.params;
    
    const products = await productService.getProductsByGender(
        sort,
        parseInt(offset),
        parseInt(limit),
        gender);
    
    res.status(200).json({ data : products });
});

const getProductDetails = catchAsync(async (req, res) => {
    const productId = parseInt(req.params.productId);
    const detail = await productService.getProductDetailsByProductId(productId)

    return res.status(200).json({ data : detail });
})

module.exports = {
    getProductsByGender,
    getProductDetails
}