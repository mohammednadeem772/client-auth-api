const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const routes = require("./src/routes/index");

const app = express();

app.use(cors());
app.use(bodyParser.json());

app.use("/api", routes);

app.get("/api", (req, res) => {
    res.send("API is running...");
});

module.exports = app;