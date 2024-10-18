const Transaction = require('../models/transaksi');
const Product = require('../models/product');
const { calculateDiscount, isFreeShipping } = require('../utils/utils');

exports.createTransaction = async (req, res) => {
    const { productId, quantity } = req.body;
    const customerId = req.user.id;

    try {
        const product = await Product.findByPk(productId);
        if (!product) {
            return res.status(404).json({ message: 'Product not found' });
        }

        const total = product.price * quantity;
        const freeShipping = isFreeShipping(total);
        const discount = calculateDiscount(total);

        const finalTotal = total - discount;

        const transaction = await Transaction.create({ customerId, productId, total: finalTotal });
        res.status(201).json({
            transaction,
            freeShipping,
            discount,
            finalTotal,
        });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};

exports.getTransactionsByCustomer = async (req, res) => {
    const customerId = req.user.id;
    const transactions = await Transaction.findAll({ where: { customerId } });
    res.json(transactions);
};
