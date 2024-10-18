const express = require('express');
const { createTransaction, getTransactionsByCustomer } = require('../controllers/transaksiController');
const authenticateJWT = require('../middleware/authMiddleware');

const router = express.Router();

router.post('/', authenticateJWT, createTransaction);
router.get('/', authenticateJWT, getTransactionsByCustomer);

module.exports = router;
