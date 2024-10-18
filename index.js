const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');
const { sequelize } = require('./config/db');

dotenv.config();

const customerRoutes = require('./routes/customerRoutes');
const merchantRoutes = require('./routes/merchantRoutes');
const productRoutes = require('./routes/productRoutes');
const transactionRoutes = require('./routes/transaksiRoutes');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

app.use('/api/customers', customerRoutes);
app.use('/api/merchants', merchantRoutes);
app.use('/api/products', productRoutes);
app.use('/api/transactions', transactionRoutes);

app.listen(PORT, async () => {
    console.log(`Server is running on http://localhost:${PORT}`);
    await sequelize.sync(); // Sync database
});
