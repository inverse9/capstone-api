const express = require('express');
const upload = require('../middlewares/upload');

const router = express.Router();

router.post('/upload', upload.array('images', 10), (req, res) => {
  if (!req.files || req.files.length === 0) {
    return res.status(400).json({ message: 'No files selected' });
  }

  const fileInfos = req.files.map(file => ({
    filename: file.filename,
    path: file.path,
  }));

  res.status(200).json({
    message: 'Files uploaded successfully',
    files: fileInfos
  });
});

module.exports = router;
