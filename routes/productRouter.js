const productRouter = require('express').Router();
const productController = require('../controllers/productController');

productRouter.get('', productController.getProducts);
productRouter.get('/:productId', productController.getProductDetails);

module.exports = productRouter;