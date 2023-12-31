# ShopEase: Your Effortless Shopping Companion
![ShopEase](https://res.cloudinary.com/dnkkh5vuz/image/upload/v1704033163/dgaknfkldwmnockoz0ac.jpg)

ShopEase is an all-in-one e-commerce application aimed at simplifying your online shopping journey. With Flutter for a sleek interface, Node.js and Express.js for a robust backend, and MongoDB for secure data storage, it ensures a smooth user experience. Utilizing HashMap for streamlined operations, ShopEase focuses on making shopping easier for both customers and admin (sellers).



## Technologies Used

### Front End
- [![My Skills](https://skillicons.dev/icons?i=java,kotlin,nodejs,figma&theme=light)](https://skillicons.dev)

### Back End
- [![Node.js](https://img.shields.io/badge/Node.js-43853D?style=flat-square&logo=node.js&logoColor=white)](https://nodejs.org/)
- [![Express.js](https://img.shields.io/badge/Express.js-000000?style=flat-square&logo=express&logoColor=white)](https://expressjs.com/)

### Database
- [![MongoDB](https://img.shields.io/badge/MongoDB-4EA94B?style=flat-square&logo=mongodb&logoColor=white)](https://www.mongodb.com/)

## Utilizing HashMap for Efficient Product Management

ShopEase employs a HashMap for managing products efficiently. The following code snippets demonstrate its usage:

```javascript
const productHashMap = new Map(); // HashMap to store product uniqueness

const addToProductHashMap = (product) => {
    const productHash = `${product.name}_${product.description}_${product.images}_${product.category}_${product.price}`;
    productHashMap.set(productHash, product);
};

const fetchProducts = async () => {
    try {
        const products = await Product.find({});
        products.forEach((product) => {
            addToProductHashMap(product);
        });
    } catch (err) {
        console.error("Error fetching products: ", err);
    }
};

const fetchCategoryWiseProductToHashMap = async (category) => {
    try {
        const categoryProducts = await Product.find({ 'category': category });

        categoryProducts.forEach((product) => {
            addToProductHashMap(product);
        });
    } catch (err) {
        console.error(`Error fetching ${category} products: `, err);
    }
};

const deleteProductFromHashMap = (productId) => {
    for (const [key, value] of productHashMap.entries()) {
        if (value._id.toString() === productId.toString()) {
            productHashMap.delete(key);
            break;
        }
    }
};

const updateProductInHashMap = async (productId) => {
    try {
        const product = await Product.findById(productId);
        addToProductHashMap(product);
    } catch (err) {
        console.error(`Error updating product ${productId} in HashMap: `, err);
    }
};

// Fetch products and store in HashMap during server startup
fetchProducts();
