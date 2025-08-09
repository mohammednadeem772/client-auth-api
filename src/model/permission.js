"use Strict";

module.exports = (sequelize, DataTypes) => {
  const Permission = sequelize.define("Permission", {
    name: {
      type: DataTypes.STRING,
      unique: true,
      allowNull: false,
    },
    description: { type: DataTypes.STRING },
  });
  return Permission;
};
