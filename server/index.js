const express = require('express');
const path = require('path'); 
const mongoose = require("mongoose");

const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');
const productRouter = require('./routes/product');
const userRouter = require('./routes/user');
const PORT = process.env.PORT || 3000;
const app = express();
const userName = process.env.DB_USERNAME;
const password = encodeURIComponent(process.env.DB_PASSWORD);


const DB = `mongodb+srv://mddprado00290:1234@shopease.ouo3kxt.mongodb.net/?retryWrites=true&w=majority`;

// middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

mongoose.connect(DB).then(()=>{
    console.log('Mongoose connected successfully');
}).catch((e) => {
    console.log(e);
})

app.get("/shopease" , (req, res) => {
    res.send("Welcome to ShopEase!");
})

app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port: ${PORT}`)
});


