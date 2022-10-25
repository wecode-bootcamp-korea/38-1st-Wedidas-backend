const productService = require('../services/productService');
const { catchAsync } = require('../utils/error');

const getProducts = catchAsync(async (req, res) => {   
    const { sort, size, offset, limit } = req.query;
    const { gender } = req.params;

    const products = await productService.getProducts(
        sort,
        size,
        +offset,
        +limit,
        gender);
    
    res.status(200).json({ data : products });
});


module.exports = {
    getProducts
}