const express = require('express');
const mongoose = require('mongoose');
const http = require('http');
const socketIo = require('socket.io');
const bodyParser = require('body-parser');

mongoose.connect('mongodb://localhost:27017/flutter_sync_db', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const Product = mongoose.model('Product', new mongoose.Schema({
 _id: mongoose.Schema.Types.ObjectId,
  name: String,
  description: String,
  price: Number,
  page: Number,
  isSynced: { type: Boolean, default: false },
}));

const app = express();
const server = http.createServer(app);
const io = socketIo(server);

app.use(bodyParser.json());

// API to get paginated products
app.get('/products', async (req, res) => {
  const page = parseInt(req.query.page || 1);
  const pageSize = 10;
  const totalProducts = await Product.countDocuments();
  const totalPages = Math.ceil(totalProducts / pageSize);

  const products = await Product.find()
    .skip((page - 1) * pageSize)
    .limit(pageSize);

  res.json({
    data: products,
    currentPage: page,
    totalPages: totalPages,
  });
});

// Sync products from Flutter app
app.post('/sync', async (req, res) => {
  const { products } = req.body;
 
  await Product.insertMany(products);
  io.emit('sync-update', products);  // Notify clients about the sync
  res.status(200).send({ message: 'Sync successful' });
});

// Handle socket connection
io.on('connection', (socket) => {
  console.log('Client connected');
  
  // Handle incoming data from Flutter
  socket.on('sync', async (data) => {
    await Product.create(data);
    socket.emit('sync-update', data);  // Sync with other clients
  });
});

server.listen(3000, () => {
  console.log('Server running on http://localhost:3000');
});
