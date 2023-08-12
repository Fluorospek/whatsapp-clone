const express = require("express");
const app = express();
const cors = require("cors");
const http = require("http");
const port = process.env.PORT || 5000;
const serverless = require("serverless-http");
const router = express.Router();

var server = http.createServer(app);

// router.get("/", (req, res) => {
//   return res.json("Hello World");
// });

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
    let targetID = data.target;
    if (clients[targetID]) clients[targetID].emit("message", data);
  });
});

server.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

// app.use("/.netlify/functions/index", router);

// module.exports.handler = serverless(app);
