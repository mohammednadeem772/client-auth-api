const db = require("../config/database");

exports.getAllCategories = async (req, res) => {
  const categories = await db.category.findAll();
  res.json(categories);
};

exports.createCategory = async (req, res) => {
  const category = await db.category.create(req.body);
  res.status(201).json(category);
};

exports.getCategoryById = async (req, res) => {
  const category = await db.category.findByPk(req.params.id);
  if (!category) return res.status(404).json({ error: "Category not found" });
  res.json(category);
};

exports.updateCategory = async (req, res) => {
  const category = await db.category.findByPk(req.params.id);
  if (!category) return res.status(404).json({ error: "Category not found" });
  await category.update(req.body);
  res.json(category);
};

exports.deleteCategory = async (req, res) => {
  const category = await db.category.findByPk(req.params.id);
  if (!category) return res.status(404).json({ error: "Category not found" });
  await category.destroy();
  res.json({ message: "Category deleted" });
};
