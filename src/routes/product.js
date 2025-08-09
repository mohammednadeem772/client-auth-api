const express = require("express");
const router = express.Router();
const productController = require("../controller/productController");
const authenticateClient = require("../middlewares/authMiddleware");
const dynamicAuthorize = require("../middlewares/dynamicAuthorize");

router.use(authenticateClient);

router.get("/", dynamicAuthorize("product"), productController.getAllProducts);
router.get(
  "/:id",
  dynamicAuthorize("product"),
  productController.getProductById
);
router.post("/", dynamicAuthorize("product"), productController.createProduct);
router.put(
  "/:id",
  dynamicAuthorize("product"),
  productController.updateProduct
);
router.delete(
  "/:id",
  dynamicAuthorize("product"),
  productController.deleteProduct
);

module.exports = router;
