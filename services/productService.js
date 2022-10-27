const { CustomRepositoryCannotInheritRepositoryError } = require('typeorm');
const productDao = require('../models/productDao');

const getProducts = async (offset, limit, gender) => {
    return await productDao.getProducts(offset, limit, gender);
};

const getCategoryAllProducts = async (gender, category, offset, limit) => {
    
    function searchByCategory(category) {
        const categorySet = {
          all:  ``,
          originals:  `AND sc.name = 'originals'`,
          slipper: `AND sc.name = 'slipper'`,
          soccer:  `AND sc.name = 'soccer'`
        }
        
        return category ? categorySet[category] : `mc.name ='men'`
      }
      
    return await productDao.getCategoryAllProducts(gender, searchByCategory(category), offset, limit);
}

module.exports = {
    getProducts,
    getCategoryAllProducts
}