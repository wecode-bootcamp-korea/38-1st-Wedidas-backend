const productService = require('../services/productService');
const { catchAsync } = require('../utils/error');

const getProducts = catchAsync(async (req, res) => {   
    const offset = await req.query.offset;
    const limit = await req.query.limit;
    const gender = await req.query.gender;

    const products = await productService.getProducts(offset,limit,gender);
    
    res.status(200).json({ data : products });
});

module.exports = {
    getProducts
}