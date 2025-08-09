const authorize = require("./authorize"); // See below

function getPermissionName(method, resource) {
  const methodMap = {
    GET: "read",
    POST: "create",
    PUT: "update",
    PATCH: "update",
    DELETE: "delete",
  };

  const action = methodMap[method.toUpperCase()];
  if (!action) throw new Error(`Unsupported HTTP method: ${method}`);

  return `${action}_${resource.toLowerCase()}`;
}

function dynamicAuthorize(resource) {
  return (req, res, next) => {
    try {
      const permission = getPermissionName(req.method, resource);
      return authorize(permission)(req, res, next);
    } catch (err) {
      return res.status(400).json({ error: err.message });
    }
  };
}

module.exports = dynamicAuthorize;
