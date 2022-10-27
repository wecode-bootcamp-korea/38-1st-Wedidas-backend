const productRouter = require('express').Router();
const productController = require('../controllers/productController');

productRouter.get('/', productController.getProducts);
productRouter.get('/:gender/:category', productController.getCategoryAllProducts);

module.exports = productRouter;