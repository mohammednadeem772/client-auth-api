const db = require("../config/database");

exports.getAllRoles = async (req, res) => {
  try {
    const roles = await db.role.findAll({
      attributes: ["id", "name"],
      include: [
        {
          model: db.permission,
          as: "permissions",
        },
      ],
    });
    res.status(200).json(roles);
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Something went wrong" });
  }
};

exports.getRoleById = async (req, res) => {
  try {
    const role = await db.role.findByPk(req.params.id, {
      attributes: ["id", "name"],
      include: [
        {
          model: db.permission,
        },
      ],
    });
    res.status(200).json(role);
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Something went wrong" });
  }
};
