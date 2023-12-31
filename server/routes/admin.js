const express = require("express");
const admin = require("../middlewares/admin");
const { Product } = require("../model/product");
const Order = require("../model/order");

const adminRouter = express.Router();

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

adminRouter.post("/admin/add-product", admin, async (req, res) => {
    try {
        const { name, description, images, quantity, price, category } = req.body;

        const productHash = `${name}_${description}_${images}_${category}_${price}`;

        if (productHashMap.has(productHash)) {
            res.status(400).json({ error: "Duplicate product" });
            return;
        }

        let product = new Product({ name, description, images, quantity, price, category });
        product = await product.save();

        addToProductHashMap(product); // Add new product to HashMap

        res.json(product);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

adminRouter.get("/admin/get-products", admin, async (req, res) => {
    try {
        if (productHashMap.size === 0) {
            await fetchProducts();
        }

        const products = Array.from(productHashMap.values());
        res.json(products);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

adminRouter.get("/admin/get-category-product/:category", admin, async (req, res) => {
    try {
        const { category } = req.params;

        if (productHashMap.size === 0) {
            await fetchProducts();
        }

        if (!productHashMap.has(category)) {
            await fetchCategoryWiseProductToHashMap(category);
        }

        const categoryProducts = Array.from(productHashMap.values())
            .filter(product => product.category === category);

        res.json(categoryProducts);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

adminRouter.post("/admin/delete-product", admin, async (req, res) => {
    try {
        const { id } = req.body;
        let product = await Product.findByIdAndDelete(id);
        
        deleteProductFromHashMap(id); // Delete product from HashMap

        res.json(product);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

adminRouter.get("/admin/get-orders", admin, async (req, res) => {
    try {
        const orders = await Order.find({});
        res.json(orders);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

adminRouter.post("/admin/change-order-status", admin , async (req, res) => {
    try {
        const { status, id } = req.body;

        let order = await Order.findById(id);

        order.status = status;

        order = await order.save();

        res.json(order);

    } catch (e) {
        res.status(500).json({error : e.message});

    }
});

adminRouter.get("/admin/analytics", admin, async ( req, res) => {
    try {
        
        const orders = await Order.find({});
        let totalEarnings = 0;

        for( let i = 0; i< orders.length; i++){
            for( let j = 0; j < orders[i].products.length ; j++){
                totalEarnings += orders[i].products[j].quantity * orders[i].products[j].product.price;
            }
        }

        // CATEGORY WISE ORDERS FETCHING
        let mobileEarnings = await fetchCategoryWiseProduct('Mobiles');
        let fashionEarnings = await fetchCategoryWiseProduct('Fashion');
        let electronicsEarnings = await fetchCategoryWiseProduct('Electronics');
        let homeEarnings = await fetchCategoryWiseProduct('Home');
        let beautyEarnings = await fetchCategoryWiseProduct('Beauty');
        let appliancesEarnings = await fetchCategoryWiseProduct('Appliances');
        let groceryEarnings = await fetchCategoryWiseProduct('Grocery');
        let booksEarnings = await fetchCategoryWiseProduct('Books');
        let essentialsEarnings = await fetchCategoryWiseProduct('Essentials');

        let earnings = {
            totalEarnings,
            mobileEarnings,
            fashionEarnings,
            electronicsEarnings,
            homeEarnings,
            beautyEarnings,
            appliancesEarnings,
            groceryEarnings,
            booksEarnings,
            essentialsEarnings,
        }

        res.json(earnings);

    } catch (e) {
        res.status(500).json({error : e.message});

    }
})

async function fetchCategoryWiseProduct(category){
    let earnings = 0;
    let categoryOrders = await Order.find({
        'products.product.category' : category,
    });

    for(let i=0; i<categoryOrders.length; i++){
        for (let j=0; j< categoryOrders[i].products.length; j++){
            earnings += categoryOrders[i].products[j].quantity * categoryOrders[i].products[j].product.price;
        }
    }
    return earnings;
}

module.exports = adminRouter;

