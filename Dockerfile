# Gunakan image Node.js versi 14 sebagai base image
FROM node:14

# Tentukan direktori kerja di dalam container
WORKDIR /app

# Salin semua file project ke dalam container
COPY . .

# Tentukan environment untuk production dan host database
ENV NODE_ENV=production
ENV DB_HOST=item-db

# Install dependencies untuk production dan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Buka port 8080 agar bisa diakses dari luar container
EXPOSE 8080

# Jalankan server saat container dijalankan
CMD ["npm", "start"]
