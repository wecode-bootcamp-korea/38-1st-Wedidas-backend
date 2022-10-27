const productService = require('../services/productService');
const { catchAsync } = require('../utils/error');

const getProductsByGender = catchAsync(async (req, res) => {   
    const { sort, category, offset, limit } = req.query;
    const { gender } = req.params;
    
    const products = await productService.getProductsByGender(
        sort,
        category,
        parseInt(offset),
        parseInt(limit),
        gender);
    
    res.status(200).json({ data : products });
});


module.exports = {
    getProductsByGender
}