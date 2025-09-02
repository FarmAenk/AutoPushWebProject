FROM node:20-alpine
WORKDIR /app

# Add a cache buster argument
ARG CACHEBUSTER

COPY package.json package-lock.json ./
RUN npm install

# Use the cache buster before copying to invalidate the cache
RUN echo "Cache buster: $CACHEBUSTER"
COPY . .

EXPOSE 3000
CMD ["node", "index.js"]
