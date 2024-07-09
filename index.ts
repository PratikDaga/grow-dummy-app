import express from 'express';
import cors from 'cors';
import { Client } from 'pg';

const app = express();
const port = 3000;

const client = new Client({
  user: 'postgres',
  host: 'localhost',
  database: 'groww_portfolio',
  password: 'Pratik@21',
  port: 5432,
});

client.connect();

app.use(cors()); // Enable CORS

app.get('/portfolio', async (req, res) => {
  try {
    const result = await client.query('SELECT * FROM portfolio');
    res.json(result.rows);
  } catch (error) {
    res.status(500).send(error);
  }
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
