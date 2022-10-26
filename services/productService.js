const productDao = require('../models/productDao');

const getProducts = async (offset, limit, gender) => {
    return await productDao.getProducts(offset, limit, gender);
};

const getProductDetails = async (productId) => {
    let imageArray = [];
    let stockArray = [];
    
    let data = await productDao.productDetails(productId);   
    for(let i=0; i<data.length; i++){
        stockArray.push(data[i]["stocksize"][0]);
    }
    console.log(data.length)

    for(let i=0; i<data.length; i++){
    imageArray.push(data[i]["imageUrl"][0]);
    }

    data[0].stocksize = stockArray;

    const stockObject =data[0].stocksize.reduce((acc, cur)=> {
        if (acc.findIndex(({size})=>size===cur.size)===-1 ){
            acc.push(cur);
            }
              return acc;
      },[]);

    data[0].stocksize = stockObject;
    data[0].imageUrl = imageArray.filter((el,index) => imageArray.indexOf(el)===index);
    return data[0];
}



module.exports = {
    getProducts,
    getProductDetails
}