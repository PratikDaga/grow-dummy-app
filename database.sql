CREATE DATABASE groww_portfolio;
CREATE TABLE portfolio (
  id SERIAL PRIMARY KEY,
  stock_name VARCHAR(100),
  quantity INT,
  price_per_share FLOAT
);
