FROM node:18-alpine

WORKDIR /app

COPY backend/package*.json ./backend/
RUN cd backend && npm install --production

COPY frontend/package*.json ./frontend/
RUN cd frontend && npm install --production

COPY . .

EXPOSE 3000

CMD ["node", "backend/server.js"]
