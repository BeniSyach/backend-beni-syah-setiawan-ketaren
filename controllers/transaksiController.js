const Transaction = require("../models/transaksi");
const Product = require("../models/product");
const { calculateDiscount, isFreeShipping } = require("../utils/utils");
const Customer = require("../models/customer");

exports.createTransaction = async (req, res) => {
  const { productId, quantity } = req.body;
  const customerId = req.user.id;

  try {
    const product = await Product.findByPk(productId);
    if (!product) {
      return res.status(404).json({ message: "Product not found" });
    }

    const total = product.price * quantity;
    const freeShipping = isFreeShipping(total);
    const discount = calculateDiscount(total);

    const finalTotal = total - discount;

    const transaction = await Transaction.create({
      customerId,
      productId,
      ongkir: freeShipping.toString(),
      total: finalTotal,
    });
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
  try {
    const transactions = await Transaction.findAll({
      where: { customerId },
      include: [{ model: Product, as: "product" }],
    });
    res.json(transactions);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Server Error" });
  }
};

exports.getTransactionsByMerchant = async (req, res) => {
  const merchantId = req.user.id;
  try {
    const transactions = await Transaction.findAll({
      include: [
        {
          model: Product,
          as: "product",
          where: { merchantId },
        },
        {
          model: Customer,
          as: "customer",
          attributes: ["id", "name"],
        },
      ],
    });
    res.json(transactions);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Server Error" });
  }
};
