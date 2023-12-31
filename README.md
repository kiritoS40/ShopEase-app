# ShopEase: Your Effortless Shopping Companion

ShopEase is an all-in-one e-commerce application aimed at simplifying your online shopping journey. With Flutter for a sleek interface, Node.js for a robust backend, and MongoDB for secure data storage, it ensures a smooth user experience. Utilizing HashMap for streamlined operations, ShopEase focuses on making shopping easier for both customers and admin (sellers).

## Technologies Used

- **Frontend**:
  [![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white)](https://flutter.dev/)
- **Backend**:
  [![Node.js](https://img.shields.io/badge/Node.js-43853D?style=flat-square&logo=node.js&logoColor=white)](https://nodejs.org/)
- **Database**:
  [![MongoDB](https://img.shields.io/badge/MongoDB-4EA94B?style=flat-square&logo=mongodb&logoColor=white)](https://www.mongodb.com/)

## Utilizing HashMap for Efficient Product Management

The following code snippets demonstrate how ShopEase employs a HashMap for managing products efficiently:

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
