const express = require("express");
const db = require("../db.js");

const router = express.Router();
const TABLE = "object";

router.get("/", async (req, res) => {
  try {
    // Check if the "relation" query parameter is set to true
    const relation = req.query.relation === "true";

    if (relation) {
      // Query to fetch related data
      const sql = `
          SELECT 
            o.nama AS object_name,
            op.id AS property_id,
            op.judul AS property_judul,
            op.isi AS property_isi,
            oi.id AS image_id,
            oi.src AS image_src
          FROM 
            object o
          JOIN 
            object_properties op ON o.id = op.object_id
          JOIN 
            object_image oi ON o.id = oi.object_id
          ORDER BY 
            o.id;
        `;

      // Execute the query to fetch related data
      db.query(sql, (err, results) => {
        if (err) {
          return res.status(500).json({ error: err.message });
        }

        // Structure the data into grouped JSON format
        const structuredData = results.reduce((acc, row) => {
          let object = acc.find((obj) => obj.object_name === row.object_name);

          if (!object) {
            object = {
              object_name: row.object_name,
              properties: [],
              images: [],
            };
            acc.push(object);
          }

          // Add property if not already added
          if (!object.properties.some((prop) => prop.id === row.property_id)) {
            object.properties.push({
              id: row.property_id,
              judul: row.property_judul,
              isi: row.property_isi,
            });
          }

          // Add image if not already added
          if (!object.images.some((img) => img.id === row.image_id)) {
            object.images.push({
              id: row.image_id,
              src: row.image_src,
            });
          }

          return acc;
        }, []);

        // Return the structured JSON
        res.json(structuredData);
      });
    } else {
      // Query to fetch raw data from the table
      const sql = `SELECT * FROM ${TABLE}`;

      // Execute the query
      db.query(sql, (err, results) => {
        if (err) {
          return res.status(500).json({ error: err.message });
        }

        // Return the raw results as JSON
        res.json(results);
      });
    }
  } catch (error) {
    // Catch any unexpected errors and respond with a 500 status
    res.status(500).json({ error: "Internal server error" });
  }
});
router.get("/:id", (req, res) => {
  const sql = `SELECT * FROM ${TABLE} WHERE id = ?`;
  db.query(sql, [req.params.id], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    if (result.length === 0)
      return res.status(404).json({ message: "Objext not found" });
    res.json(result[0]);
  });
});

router.post("/", (req, res) => {
  const { nama, user_id } = req.body;
  const sql = `INSERT INTO ${TABLE} (nama, user_id) VALUES (?, ?)`;
  db.query(sql, [nama, user_id], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ id: result.insertId, nama, user_id });
  });
});

router.put("/:id", (req, res) => {
  const { nama, scanned } = req.body;
  const fields = [];
  const values = [];

  if (nama !== undefined) {
    fields.push("nama = ?");
    values.push(nama);
  }

  if (scanned !== undefined) {
    fields.push("scanned = ?");
    values.push(scanned);
  }

  if (fields.length === 0) {
    return res.status(400).json({ error: "No fields provided for update" });
  }

  values.push(req.params.id);

  const sql = `UPDATE ${TABLE} SET ${fields.join(", ")} WHERE id = ?`;

  db.query(sql, values, (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({
      message: "Object updated successfully",
      affectedRows: result.affectedRows,
    });
  });
});

router.delete("/:id", (req, res) => {
  const sql = `DELETE FROM ${TABLE} WHERE id = ?`;
  db.query(sql, [req.params.id], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: "Object deleted successfully" });
  });
});

module.exports = router;
