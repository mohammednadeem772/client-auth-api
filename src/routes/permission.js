const express = require("express");
const router = express.Router();
const permissionController = require("../controller/permissionController");

router.get("/", permissionController.getAllPermissions);
router.get("/:id", permissionController.getPermissionById);

module.exports = router;
