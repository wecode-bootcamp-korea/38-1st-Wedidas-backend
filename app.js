require("dotenv").config();

const express = require('express');
const cors = require('cors');
const morgan =require('morgan');

const app = express();

app.get('/ping', (req, res) => {
  res.json({ message: 'pong' });
});

const PORT = process.env.PORT;

const start = async () => {
  try {
    app.listen(PORT, () => console.log(`Server is listening on ${PORT}`));
  } catch (err) {
    console.error(err);
  }
}

start();