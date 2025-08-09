const db = require("../config/database");
const bcrypt = require("bcrypt");

async function authenticateClient(req, res, next) {
  try {
    const clientId = req.headers["x-client-id"];
    const clientSecret = req.headers["x-client-secret"];

    if (!clientId || !clientSecret) {
      return res.status(401).json({ error: "Client credentials missing" });
    }

    const client = await db.client.findOne({
      where: { clientId, isActive: true },
      include: [
        {
          model: db.role,
          as: "roles",
          through: { attributes: [] },
          include: [
            {
              model: db.permission,
              as: "permissions",
              through: { attributes: [] },
            },
          ],
        },
      ],
    });

    if (!client)
      return res.status(401).json({ error: "Invalid client credentials" });

    const valid = await bcrypt.compare(clientSecret, client.clientSecret);
    if (!valid)
      return res.status(401).json({ error: "Invalid client credentials" });

    // Aggregate permissions from all roles
    const permissionsSet = new Set();
    client.roles.forEach((role) => {
      role.permissions.forEach((permission) => {
        permissionsSet.add(permission.name);
      });
    });

    req.client = {
      id: client.id,
      clientId: client.clientId,
      permissions: [...permissionsSet],
    };

    next();
  } catch (error) {
    console.error("Authentication error:", error);
    res.status(500).json({ error: "Internal server error" });
  }
}

module.exports = authenticateClient;
