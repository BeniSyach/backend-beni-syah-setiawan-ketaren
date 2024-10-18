const express = require('express');
const { createProduct, getProducts } = require('../controllers/productController');
const authenticateJWT = require('../middleware/authMiddleware');
const checkMerchantRole = require('../middleware/roleMiddleware');

const router = express.Router();

router.post('/', authenticateJWT, checkMerchantRole, createProduct);
router.get('/', getProducts);

module.exports = router;
