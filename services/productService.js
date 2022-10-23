const productDao = require('../models/productDao');

const getProducts = async (sort, size, offset, limit, gender) => {
    offset = +offset;
    limit = +limit;

    if(sort === 'high'){
        sort = 'p.price desc';
      }else if(sort === 'low'){ 
        sort = 'p.price';
      }else if(sort === 'new'){
        sort = 'p.id';
      }else if(sort === 'old'){
        sort = 'p.id desc';
      }else if(sort === undefined){
        sort = 'p.id';
      }
      console.log(sort)

    return await productDao.getProducts(sort, size, offset, limit, gender);
};

module.exports = {
    getProducts
}