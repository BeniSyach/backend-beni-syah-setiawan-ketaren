const express = require('express');
const { createTransaction, getTransactionsByCustomer, getTransactionsByMerchant } = require('../controllers/transaksiController');
const authenticateJWT = require('../middleware/authMiddleware');

const router = express.Router();

router.post('/', authenticateJWT, createTransaction);
router.get('/customer', authenticateJWT, getTransactionsByCustomer);
router.get('/merchant', authenticateJWT, getTransactionsByMerchant);

module.exports = router;
