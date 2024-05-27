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

# Fetching the latest nginx image
FROM nginx:1.21.0-alpine AS production

# Copy built assets from builder
COPY --from=builder /app/build /usr/share/nginx/html

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
