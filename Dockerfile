FROM node:18-alpine

WORKDIR /app

# Copy only dependency files first (for caching)
COPY backend/package*.json ./backend/
RUN cd backend && npm install --production

COPY frontend/package*.json ./frontend/
RUN cd frontend && npm install --production

# Copy rest of code
COPY . .

EXPOSE 3000

CMD ["node", "backend/server.js"]
