const express = require("express");
const http = require("http");
const app = express();
const cors = require("cors");
const port = process.env.PORT || 7000;
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
const routes = require("./routes");

app.use("/routes", routes);

app.use("/uploads", express.static("uploads"));

io.on("connection", (socket) => {
  console.log("Connected");
  console.log(socket.id, "has joined");
  socket.on("signin", (id) => {
    console.log(id);
    clients[id] = socket;
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

// app.use("/.netlify/functions/index", router);

// module.exports.handler = serverless(app);
