const db = require("../config/database");
const bcrypt = require("bcrypt");

async function seedRolePermissionClient() {
  console.log("Running role, permission & client seeder...");

  const rolesData = [
    { name: "admin" }, // full permission
    { name: "read_write" }, // read + create
    { name: "update_delete" }, // update + delete
    { name: "read" },
    { name: "write" },
    { name: "update" },
    { name: "delete" },
  ];

  const permissionsData = [
    { name: "read_product", description: "Read products" },
    { name: "create_product", description: "Create products" },
    { name: "update_product", description: "Update products" },
    { name: "delete_product", description: "Delete products" },
    { name: "read_category", description: "Read categories" },
    { name: "create_category", description: "Create categories" },
    { name: "update_category", description: "Update categories" },
    { name: "delete_category", description: "Delete categories" },
  ];

  // Check if already seeded
  const existingRoles = await db.role.count();
  if (existingRoles > 0) {
    console.log("Roles already seeded, skipping...");
    return;
  }

  // Create roles and permissions
  const roles = await db.role.bulkCreate(rolesData, { returning: true });
  const permissions = await db.permission.bulkCreate(permissionsData, {
    returning: true,
  });

  // Helper fn to get permission objects by name
  function perms(names) {
    return permissions.filter((p) => names.includes(p.name));
  }

  // Assign permissions to roles
  // admin = all permissions
  await roles.find((r) => r.name === "admin").setPermissions(permissions);

  // read_write = read + create permissions (products + categories)
  await roles
    .find((r) => r.name === "read_write")
    .setPermissions(
      perms([
        "read_product",
        "create_product",
        "read_category",
        "create_category",
      ])
    );

  // update_delete = update + delete permissions
  await roles
    .find((r) => r.name === "update_delete")
    .setPermissions(
      perms([
        "update_product",
        "delete_product",
        "update_category",
        "delete_category",
      ])
    );

  // read = only read
  await roles
    .find((r) => r.name === "read")
    .setPermissions(perms(["read_product", "read_category"]));

  // write = only create
  await roles
    .find((r) => r.name === "write")
    .setPermissions(perms(["create_product", "create_category"]));

  // update = only update
  await roles
    .find((r) => r.name === "update")
    .setPermissions(perms(["update_product", "update_category"]));

  // delete = only delete
  await roles
    .find((r) => r.name === "delete")
    .setPermissions(perms(["delete_product", "delete_category"]));

  // Create 10 clients with various roles
  const clientsData = [
    {
      name: "Admin Client 1",
      clientId: "admin1",
      clientSecret: "adminsecret1",
      roleName: "admin",
    },
    {
      name: "Admin Client 2",
      clientId: "admin2",
      clientSecret: "adminsecret2",
      roleName: "admin",
    },

    {
      name: "RW Client 1",
      clientId: "rw1",
      clientSecret: "rwsecret1",
      roleName: "read_write",
    },
    {
      name: "RW Client 2",
      clientId: "rw2",
      clientSecret: "rwsecret2",
      roleName: "read_write",
    },

    {
      name: "UD Client 1",
      clientId: "ud1",
      clientSecret: "udsecret1",
      roleName: "update_delete",
    },
    {
      name: "UD Client 2",
      clientId: "ud2",
      clientSecret: "udsecret2",
      roleName: "update_delete",
    },

    {
      name: "Write Client",
      clientId: "write1",
      clientSecret: "wsecret1",
      roleName: "write",
    },

    {
      name: "Read Client",
      clientId: "read1",
      clientSecret: "rsecret1",
      roleName: "read",
    },

    {
      name: "Update Client",
      clientId: "update1",
      clientSecret: "usecret1",
      roleName: "update",
    },

    {
      name: "Delete Client",
      clientId: "delete1",
      clientSecret: "dsecret1",
      roleName: "delete",
    },
  ];

  for (const c of clientsData) {
    const hashedSecret = await bcrypt.hash(c.clientSecret, 10);
    const client = await db.client.create({
      name: c.name,
      clientId: c.clientId,
      clientSecret: hashedSecret,
      isActive: true,
    });
    const role = roles.find((r) => r.name === c.roleName);
    await client.setRoles([role]);
  }

  // Create 5 products
  const productsData = [
    {
      name: "Product 1",
      price: 10.99,
      description: "Description of Product 1",
    },
    {
      name: "Product 2",
      price: 19.99,
      description: "Description of Product 2",
    },
    {
      name: "Product 3",
      price: 29.99,
      description: "Description of Product 3",
    },
    {
      name: "Product 4",
      price: 39.99,
      description: "Description of Product 4",
    },
    {
      name: "Product 5",
      price: 49.99,
      description: "Description of Product 5",
    },
  ];

  await db.product.bulkCreate(productsData);

  // Create 5 categories
  const categoriesData = [
    { name: "Category 1" },
    { name: "Category 2" },
    { name: "Category 3" },
    { name: "Category 4" },
    { name: "Category 5" },
  ];

  await db.category.bulkCreate(categoriesData);

  console.log("Seeding complete");
}

module.exports = seedRolePermissionClient;
