const productRouter = require('express').Router();
const productController = require('../controllers/productController');

productRouter.get('/:gender', productController.getProductsByGender);

module.exports = productRouter;