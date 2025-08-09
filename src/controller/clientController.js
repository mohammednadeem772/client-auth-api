const db = require("../config/database");
const bcrypt = require("bcrypt");

exports.getAllClients = async (req, res) => {
  try {
    const clients = await db.client.findAll({
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
    res.json(clients);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.getClientById = async (req, res) => {
  try {
    const client = await db.client.findByPk(req.params.id, {
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
    if (!client) return res.status(404).json({ error: "Client not found" });
    res.json(client);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.createClient = async (req, res) => {
  try {
    const { name, clientId, clientSecret, roleIds } = req.body;
    if (!name || !clientId || !clientSecret)
      return res.status(400).json({ error: "Missing required fields" });

    const hashedSecret = await bcrypt.hash(clientSecret, 10);

    const newClient = await db.client.create({
      name,
      clientId,
      clientSecret: hashedSecret,
      isActive: true,
    });

    if (roleIds && Array.isArray(roleIds)) {
      const roles = await db.role.findAll({ where: { id: roleIds } });
      await newClient.setRoles(roles);
    }

    const clientWithRoles = await db.client.findByPk(newClient.id, {
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

    res.status(201).json(clientWithRoles);
  } catch (err) {
    if (err.name === "SequelizeUniqueConstraintError") {
      return res.status(400).json({ error: "clientId must be unique" });
    }
    res.status(500).json({ error: err.message });
  }
};

exports.updateClient = async (req, res) => {
  try {
    const client = await db.client.findByPk(req.params.id);
    if (!client) return res.status(404).json({ error: "Client not found" });

    const { name, clientSecret, roleIds, isActive } = req.body;

    if (name !== undefined) client.name = name;
    if (typeof isActive === "boolean") client.isActive = isActive;

    if (clientSecret) {
      client.clientSecret = await bcrypt.hash(clientSecret, 10);
    }

    await client.save();

    if (roleIds && Array.isArray(roleIds)) {
      const roles = await db.role.findAll({ where: { id: roleIds } });
      await client.setRoles(roles);
    }

    const updatedClient = await db.client.findByPk(client.id, {
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

    res.json(updatedClient);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.deleteClient = async (req, res) => {
  try {
    const client = await db.client.findByPk(req.params.id);
    if (!client) return res.status(404).json({ error: "Client not found" });

    await client.destroy();
    res.json({ message: "Client deleted" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
