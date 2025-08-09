const express = require("express");
const router = express.Router();
const categoryController = require("../controller/categoryController");
const authenticateClient = require("../middlewares/authMiddleware");
const dynamicAuthorize = require("../middlewares/dynamicAuthorize");

router.use(authenticateClient);

router.get(
  "/",
  dynamicAuthorize("category"),
  categoryController.getAllCategories
);
router.get(
  "/:id",
  dynamicAuthorize("category"),
  categoryController.getCategoryById
);
router.post(
  "/",
  dynamicAuthorize("category"),
  categoryController.createCategory
);
router.put(
  "/:id",
  dynamicAuthorize("category"),
  categoryController.updateCategory
);
router.delete(
  "/:id",
  dynamicAuthorize("category"),
  categoryController.deleteCategory
);

module.exports = router;
