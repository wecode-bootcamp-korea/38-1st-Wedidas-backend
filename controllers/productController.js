const productService = require('../services/productService');
const { catchAsync } = require('../utils/error');

const getProducts = catchAsync(async (req, res) => {   
    const offset = req.query.offset;
    const limit = req.query.limit;
    const gender = req.query.gender;

    const products = await productService.getProducts(offset,limit,gender);
    
    res.status(200).json({ data : products });
});

const getCategoryAllProducts = catchAsync(async (req, res) => { 
    const gender = req.params.gender;
    const category = req.params.category;
    const offset = req.query.offset;
    const limit = req.query.limit;

    const getCategoryAll = await productService.getCategoryAllProducts(gender, category, offset, limit);

    res.status(200).json({ data : getCategoryAll });
});

module.exports = {
    getProducts,
    getCategoryAllProducts
}