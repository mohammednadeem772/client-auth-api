const {Sequelize} = require("sequelize");
const {DB_USER, DB_PASSWORD, DB_HOST, DB_NAME, DB_PORT} = require("./dotenv.config");

const sequelize = new Sequelize(DB_NAME, DB_USER, DB_PASSWORD, {
    host: DB_HOST,
    port: DB_PORT,
    dialect: "postgres",
    underscored: true,
    logging: false,
});

const db = {};

// Sequelize instance
db.Sequelize = Sequelize;

// Sequelize connection instance
db.sequelize = sequelize;

db.client = require("../model/client")(sequelize, Sequelize);
db.role = require("../model/role")(sequelize, Sequelize);
db.permission = require("../model/permission")(sequelize, Sequelize);
db.product = require("../model/product")(sequelize, Sequelize);
db.category = require("../model/category")(sequelize, Sequelize);

db.client.belongsToMany(db.role, {through: "ClientRole", foreignKey: "clientId", otherKey: "roleId", as:"roles"});
db.role.belongsToMany(db.client, {through: "ClientRole", foreignKey: "roleId", otherKey: "clientId", as:"clients"});

db.role.belongsToMany(db.permission, {through: "RolePermission", foreignKey: "roleId", otherKey: "permissionId", as:"permissions"});
db.permission.belongsToMany(db.role, {through: "RolePermission", foreignKey: "permissionId", otherKey: "roleId", as:"roles"});





module.exports = db;