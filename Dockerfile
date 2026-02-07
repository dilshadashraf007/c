
# 1. Base image
FROM node:18-alpine

# 2. Set working directory
WORKDIR /app

# 3. Copy dependency files
COPY package*.json ./

# 4. Install dependencies
RUN npm install

# 5. Copy application source code
COPY . .

# 6. Expose port
EXPOSE 3000

# 7. Start application
CMD ["npm", "start"]
