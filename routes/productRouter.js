const productRouter = require('express').Router();
const productController = require('../controllers/productController');

productRouter.get('/:gender', productController.getProducts);


module.exports = productRouter;