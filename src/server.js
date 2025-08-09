const app = require("../index");
const db = require("./config/database");
const { PORT, IS_ROLE_PERMISSION } = require("./config/dotenv.config");
const seedRolePermissionClient = require("./seeders/rolePermissionClientSeeder");

async function startServer() {
  try {
    await db.sequelize.authenticate();
    console.log("Database connected...");
    await db.sequelize.sync({ force: true });
    // await db.sequelize.sync({alter: true});

    if (IS_ROLE_PERMISSION === "true") {
      await seedRolePermissionClient();
    }

    app.listen(PORT || 5000, () => {
      console.log(`Server running on port ${PORT}`);
    });
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
}

startServer();
