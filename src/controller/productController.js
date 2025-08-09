const db = require("../config/database");

exports.getAllProducts = async (req, res) => {
  const products = await db.product.findAll();
  res.json(products);
};

exports.getProductById = async (req, res) => {
  const product = await db.product.findByPk(req.params.id);
  if (!product) return res.status(404).json({ error: "Product not found" });
  res.json(product);
};

exports.createProduct = async (req, res) => {
  const product = await db.product.create(req.body);
  res.status(201).json(product);
};

exports.updateProduct = async (req, res) => {
  const product = await db.product.findByPk(req.params.id);
  if (!product) return res.status(404).json({ error: "Product not found" });
  await product.update(req.body);
  res.json(product);
};

exports.deleteProduct = async (req, res) => {
  const product = await db.product.findByPk(req.params.id);
  if (!product) return res.status(404).json({ error: "Product not found" });
  await product.destroy();
  res.json({ message: "Product deleted" });
};
