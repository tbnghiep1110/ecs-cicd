// Import thư viện express
const express = require('express');

// Tạo ứng dụng express
const app = express();

// Đặt cổng cho ứng dụng
const PORT = process.env.PORT || 80;

// Định nghĩa một route cơ bản
app.get('/', (req, res) => {
  res.send('Chào mừng bạn đến với ứng dụng Node.js đơn giản!');
});

// Khởi động máy chủ và lắng nghe trên cổng đã chỉ định
app.listen(PORT, () => {
  console.log(`Máy chủ đang chạy tại http://localhost:${PORT}`);
});
