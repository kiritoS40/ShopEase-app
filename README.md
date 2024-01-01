# ShopEase: Your Effortless Shopping Companion
![ShopEase](https://res.cloudinary.com/dnkkh5vuz/image/upload/v1704033163/dgaknfkldwmnockoz0ac.jpg)

ShopEase is an all-in-one e-commerce application aimed at simplifying your online shopping journey. With Flutter for a sleek interface, Node.js and Express.js for a robust backend, and MongoDB for secure data storage, it ensures a smooth user experience. Utilizing HashMap for streamlined operations, ShopEase focuses on making shopping easier for both customers and admin (sellers).



## Technologies Used

### Front End
[![Front End](https://skillicons.dev/icons?i=flutter,dart&theme=light)](https://skillicons.dev)

### Back End
[![Back End](https://skillicons.dev/icons?i=js,nodejs,express&theme=light)](https://skillicons.dev)

### Database
[![Back End](https://skillicons.dev/icons?i=mongodb&theme=light)](https://skillicons.dev)

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

const getProductFromHashMap = (productKey) => {
    return productHashMap.get(productKey);
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
```

The code above  implements a HashMap (`productHashMap`) to maintain unique product entries based on various attributes like name, description, images, category, and price. This HashMap acts as an in-memory storage structure on the backend server. It efficiently stores and retrieves products by generating a unique hash using these attributes as the key.  The `getProductFromHashMap` function retrieves a product from the HashMap using its unique key. The functions `addToProductHashMap`, `deleteProductFromHashMap`, and `updateProductInHashMap` handle adding, deleting, and updating products within this HashMap. The code interacts with the database, fetching products from it during server startup (`fetchProducts`). This HashMap acts as a supplementary, optimized storage layer, ensuring data uniqueness, and facilitating faster retrieval and manipulation of product information within the backend server alongside the database.
