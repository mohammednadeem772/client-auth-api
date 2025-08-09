function authorize(requiredPermission) {
  return (req, res, next) => {
    if (!req.client) {
      return res.status(401).json({ error: "Unauthorized" });
    }
    if (!req.client.permissions.includes(requiredPermission)) {
      return res
        .status(403)
        .json({ error: "Forbidden: insufficient permission" });
    }
    next();
  };
}

module.exports = authorize;
