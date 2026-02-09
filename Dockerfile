FROM node:18-alpine

WORKDIR /app

# Install backend dependencies first (for caching)
COPY backend/package*.json ./backend/
RUN cd backend && npm install --production

# Install frontend dependencies
COPY frontend/package*.json ./frontend/
RUN cd frontend && npm install --production

# Copy remaining code
COPY . .

EXPOSE 3000

CMD ["node", "backend/server.js"]
