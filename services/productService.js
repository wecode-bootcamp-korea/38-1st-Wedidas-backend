const productDao = require('../models/productDao');

const getProducts = async (sort, size, offset, limit, gender) => {

     function orderBy(sort) {
        const sortSet = {
          old:  'p.id',
          new:  'p.id desc',
          high: 'p.price desc',
          low:  'p.price'
        }
        return sort ? sortSet[sort] : 'p.id'
      }

     sort = orderBy(sort)

      console.log(sort)
    return await productDao.getProducts(sort, size, offset, limit, gender);
};

module.exports = {
    getProducts
}