const productRouter = require('express').Router();
const productController = require('../controllers/productController');

productRouter.get('/:gender', productController.getProductsByGender);
productRouter.get('/:productId', productController.getProductDetails);

module.exports = productRouter;