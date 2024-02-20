import express from "express";
import pg from "pg";
import dotenv from "dotenv";
import mongoose, { mongo } from 'mongoose';

// fork demo
dotenv.config({ path: "../.env" });

const { PORT, DATABASE_URL } = process.env;
// console.log(DATABASE_URL)

const client = new pg.Client({
  connectionString: DATABASE_URL,
});

await client.connect();

await mongoose.connect('mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.1.5');
console.log(await products.find())
const app = express();

app.use(express.json());

// Test Route
app.get("/api/products", (req, res, next) => {
  client
    .query("SELECT * FROM products")
    .then((result) => {
      res.send(result.rows);
    })
    .catch((err) => {
      console.error("Error during test query of products", err.stack);
      res.status(500).send("Error querying product table");
      next(err);
    });
});

// ========== Get Paramatize Product ===========
// p is short for products (mirrors Home Depot search url)
app.get("/api/p/:id", (req, res, next) => {
  const { id } = req.params;

  const query = {
    text: "SELECT * FROM products WHERE id = $1",
    values: [id], 
  };

  client
    .query(query)
    .then((data) => {
      console.log(
        `Success getting product with name: ${id}`
      );
      res.status(200).send(data.rows);
    })
    .catch((err) => {
      console.error("Error searching for product", err.stack);
      next(err);
    });
});

app.get("/api/:table_name/:id", (req, res, next) => {
  const { table_name, id } = req.params;

  client
    .query(`SELECT * FROM ${table_name} WHERE product_id = $1`, [id])
    .then((data) => {
      console.log(`Success getting product with id: ${id}`);
      res.status(200).send(data.rows);
    })
    .catch((err) => {
      console.error("Error searching for product", err.stack);
      next(err);
    });
});

app.use((err, req, res, next) => {
  console.error("Reached middleware error handling", err.stack);
  res.status(500).send("Sorry - something went wrong!");
});

app.listen(PORT, () => {
  console.log(`Listening on port ${PORT}`);
});
