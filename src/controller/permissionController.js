const e = require("express");
const db = require("../config/database");

exports.getAllPermissions = async (req, res) => {
  try {
    const permissions = await db.permission.findAll();
    res.status(200).json(permissions);
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Something went wrong" });
  }
};

exports.getPermissionById = async (req, res) => {
  try {
    const permission = await db.permission.findByPk(req.params.id);
    if (!permission) {
      return res.status(404).json({ message: "Permission not found" });
    }
    res.status(200).json(permission);
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Something went wrong" });
  }
};
