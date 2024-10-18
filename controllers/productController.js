const Merchant = require("../models/merchant");
const Product = require("../models/product");

exports.createProduct = async (req, res) => {
  const { name, price } = req.body;
  const merchantId = req.user.id;
  try {
    const product = await Product.create({ name, price, merchantId });
    res.status(201).json(product);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.getProducts = async (req, res) => {
  const products = await Product.findAll({
    include: [{ model: Merchant, as: "merchant", attributes: ["id", "name"] }],
  });
  res.json(products);
};

exports.updateProduct = async (req, res) => {
  const { id } = req.params;
  const { name, price } = req.body;

  try {
    const product = await Product.findByPk(id);
    if (!product) {
      return res.status(404).json({ message: "Produk Tidak Ditemukan" });
    }

    product.name = name || product.name;
    product.price = price || product.price;

    await product.save();
    res.json(product);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.deleteProduct = async (req, res) => {
  const { id } = req.params;

  try {
    const product = await Product.findByPk(id);
    if (!product) {
      return res.status(404).json({ message: "Produk Tidak Ditemukan" });
    }

    await product.destroy();
    res.status(204).json({ message: "Product Berhasil Dihapus" });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
