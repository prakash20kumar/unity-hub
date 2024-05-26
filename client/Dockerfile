# Use the latest Node.js image based on Alpine Linux for building the application
FROM node:alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available) to the working directory
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the application
RUN npm run build

# Use the latest Nginx image to serve the built application
FROM nginx:alpine

# Copy built assets from the builder stage to the appropriate directory in the Nginx container
COPY --from=builder /app/build /usr/share/nginx/html

# Expose port 80 to allow traffic to the Nginx server
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
