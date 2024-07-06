import { Client } from 'pg';
import express from 'express';

const app = express();
const port = 3000;

const client = new Client({
  user: 'your_username',
  host: 'localhost',
  database: 'groww_portfolio',
  password: 'your_password',
  port: 5432,
});

client.connect();

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
