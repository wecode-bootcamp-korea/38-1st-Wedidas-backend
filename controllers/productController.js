const productService = require('../services/productService');
const { catchAsync } = require('../utils/error');

const trimData = catchAsync(async (req, res) => {
    const productId = req.query.id;
    const data = await productService.trimData(productId);
    
    res.status(200).json( data );
})

const getProducts = catchAsync(async (req, res) => {   
    const offset = req.query.offset;
    const limit = req.query.limit;
    const gender = req.query.gender;

    const products = await productService.getProducts(offset, limit, gender);
    
    res.status(200).json({ data : products });
});

const productDetails = catchAsync(async (req, res) => {
    const category = req.params.category;
    const gender = req.params.gender;
    let productId = +req.params.productId;
    const detail = await productService.productDetails(gender, category, productId)
    console.log(productId)

    return res.status(200).json({ data : detail });
})

module.exports = {
    getProducts,
    productDetails,
    trimData
}