const express = require('express');
const upload = require('../middlewares/upload');

const router = express.Router();

router.post('/upload', (req, res) => {
  upload(req, res, (err) => {
    if (err) {
      return res.status(400).json({ message: err });
    }

    if (req.file == undefined) {
      return res.status(400).json({ message: 'No file selected' });
    }

    res.status(200).json({
      message: 'File uploaded successfully',
      file: `uploads/${req.file.filename}`
    });
  });
});

module.exports = router;
