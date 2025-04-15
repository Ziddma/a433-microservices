# Menggunakan base image Node.js versi 14.
FROM node:14

# Menentukan bahwa working directory untuk container adalah /app.
WORKDIR /app

# Menyalin seluruh source code ke working directory di container.
COPY . .

# Environment prod dan database host
ENV NODE_ENV=production DB_HOST=item-db

# Dependencies untuk prod dan build app 
RUN npm install --production --unsafe-perm && npm run build

# Expose port 8080
EXPOSE 8080

# Command server start saat container berhasil dibuat
CMD ["npm", "start"]
