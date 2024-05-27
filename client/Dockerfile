# Fetching the latest node image on Alpine Linux
FROM node:16-alpine AS builder

ENV NODE_ENV production

# Add a work directory
WORKDIR /app

# Cache and install dependencies
COPY package.json package-lock.json ./
RUN npm install --production

# Copy app files
COPY . .

# Build the app
RUN npm run build

# Install serve globally
RUN npm install -g serve

# Use a lighter image to serve the app
FROM node:16-alpine AS production

# Add a work directory
WORKDIR /app

# Copy built assets from builder
COPY --from=builder /app/build ./build

# Install serve globally in the production image
RUN npm install -g serve

# Expose port
EXPOSE 3000

# Start the application
CMD ["serve", "-s", "build", "-l", "3000"]
