# Use a Node.js base image
FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json first to use the cache
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy all your application files. This step will not be cached
# if any of your files (like index.html) have changed.
COPY . .

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["node", "index.js"]
