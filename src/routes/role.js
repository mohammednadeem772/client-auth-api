const express = require("express");
const router = express.Router();
const roleController = require("../controller/roleControler");

router.get("/", roleController.getAllRoles);
router.get("/:id", roleController.getRoleById);

module.exports = router;