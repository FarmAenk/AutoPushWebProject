# Stage 1: Build dependencies
FROM node:20-alpine AS builder

WORKDIR /app

# Copy dependency files first
COPY package.json package-lock.json ./

# Install dependencies. This will be cached unless dependency files change.
RUN npm install

# Copy the rest of your application code
COPY . .

# Stage 2: Production image
FROM node:20-alpine

WORKDIR /app

# Copy only the necessary files for production
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/index.js .
COPY --from=builder /app/index.html .

EXPOSE 3000

CMD ["node", "index.js"]
