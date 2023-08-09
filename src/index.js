const express = require("express");
const app = express();
const cors = require("cors");
const http = require("http");
const port = process.env.PORT || 5000;
const serverless = require("serverless-http");
const router = express.Router();

var server = http.createServer(app);

var io = require("socket.io")(server, {
  cors: {
    origin: "*",
  },
});

app.use(cors());
app.use(express.json());
var clients = {};

io.on("connection", (socket) => {
  console.log("Connected");
  console.log(socket.id, "has joined");
  socket.on("signin", (id) => {
    console.log(id);
    clients[id] = socket.id;
  });
  socket.on("message", (data) => {
    console.log(data);
    let targetID = data.targetID;
    if (clients[targetID]) clients[targetID].emit("message", data);
  });
});

server.listen(port, "0.0.0.0", () => {
  console.log(`Server is running on port ${port}`);
});

app.use("/.netlify/functions/index", router);

router.get("/", (req, res) => {
  res.json("Hello World");
});

module.exports.handler = serverless(app);
