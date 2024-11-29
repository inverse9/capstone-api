const express = require("express");
const db = require("../db.js");

const router = express.Router();
const TABLE = "scan_history";

router.get("/", (req, res) => {
  const sql = `SELECT * FROM ${TABLE}`;
  db.query(sql, (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(results);
  });
});

router.get("/:id", (req, res) => {
  const { start_date, end_date, relation } = req.body;
  const objectId = req.params.id;

  if (!start_date || !end_date) {
    return res.status(400).json({
      message:
        "Please provide both start_date and end_date in the request body.",
    });
  }

  if (relation === "true") {
    const sql = `
      SELECT 
        o.id AS id,
        o.nama AS nama
      FROM 
        object o
      JOIN 
        scan_history h ON o.id = h.object_id
      WHERE 
        h.date_time BETWEEN ? AND ? 
        AND o.id = ?;
    `;

    db.query(sql, [start_date, end_date, objectId], (err, results) => {
      if (err) return res.status(500).json({ error: err.message });
      if (results.length === 0)
        return res.status(404).json({ message: "Object not found" });

      const responseData = results.map((row) => ({
        id: row.id,
        object_name: row.nama,
      }));

      res.json(responseData);
    });
  } else {
    const sql = `SELECT * FROM ${TABLE} WHERE date_time BETWEEN ? AND ? AND id = ?`;

    db.query(sql, [start_date, end_date, objectId], (err, results) => {
      if (err) return res.status(500).json({ error: err.message });
      if (results.length === 0)
        return res.status(404).json({ message: "Scan History not found" });
      res.json(results);
    });
  }
});

router.post("/", (req, res) => {
  const { object_id } = req.body;
  const sql = `INSERT INTO ${TABLE} (object_id) VALUES (?)`;
  db.query(sql, [object_id, judul, isi], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ id: result.insertId, object_id });
  });
});

module.exports = router;
