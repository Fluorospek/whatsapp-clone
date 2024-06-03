const express = require("express");
const router = express.Router();
const multer = require("multer");
const path = require("path");

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "./uploads");
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + ".jpg");
  },
});

const upload = multer({ storage: storage });

router.route("/addimage").post(upload.single("img"), (req, res) => {
  try {
    return res.json({ path: req.file.filename });
  } catch (error) {
    return res.json(error.message);
  }
});

module.exports = router;
