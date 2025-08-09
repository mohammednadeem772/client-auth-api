const express = require("express");
const router = express.Router();

router.use("/client", require("./client"));
router.use("/role", require("./role"));
router.use("/permission", require("./permission"));
router.use("/products", require("./product"));
router.use("/categories", require("./category"));

module.exports = router;