# Stage 1: Build the application dependencies
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Stage 2: Create the final production image
FROM node:20-alpine
WORKDIR /app
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/index.js .
COPY --from=build /app/index.html .

EXPOSE 3000
CMD ["node", "index.js"]
