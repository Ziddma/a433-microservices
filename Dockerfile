# Gunakan Node.js sebagai base image
FROM node:18

# Tentukan working directory di dalam container
WORKDIR /app

# Salin file package.json dan package-lock.json ke dalam container
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Salin semua file dari project ke dalam container
COPY . .

# Expose port yang digunakan oleh aplikasi
EXPOSE 3001

# Tentukan perintah untuk menjalankan aplikasi
CMD ["node", "index.js"]