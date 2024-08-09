# Bước 1: Sử dụng image cơ sở nhẹ hơn
FROM node:18-alpine AS build

# Tạo thư mục làm việc trong container
WORKDIR /usr/src/app

# Sao chép tệp cấu hình và cài đặt phụ thuộc
COPY package*.json ./
RUN npm install --production

# Sao chép toàn bộ mã nguồn ứng dụng vào container
COPY . .

# Bước 2: Tạo image chính thức cho ứng dụng
FROM node:18-alpine

# Tạo thư mục làm việc trong container
WORKDIR /usr/src/app

# Sao chép tệp cài đặt từ build image
COPY --from=build /usr/src/app /usr/src/app

# Mở cổng mà ứng dụng sẽ lắng nghe
EXPOSE 80

# Chạy ứng dụng khi container khởi động
CMD ["node", "server.js"]
