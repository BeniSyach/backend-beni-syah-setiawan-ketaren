const express = require("express");
const {
  createProduct,
  getProducts,
  updateProduct,
  deleteProduct,
} = require("../controllers/productController");
const authenticateJWT = require("../middleware/authMiddleware");
const checkMerchantRole = require("../middleware/roleMiddleware");

const router = express.Router();

router.post("/", authenticateJWT, checkMerchantRole, createProduct);
router.get("/", getProducts);
router.put("/:id", authenticateJWT, checkMerchantRole, updateProduct);
router.delete("/:id", authenticateJWT, checkMerchantRole, deleteProduct);

module.exports = router;
