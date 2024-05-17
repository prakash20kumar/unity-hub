# Use an official Node.js runtime as a parent image
FROM node:latest AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install --silent

# Copy the rest of the application source code
COPY . .

# Build the React app
RUN npm run build

# Use a smaller image to serve the static files
FROM nginx:alpine

# Copy the build files from the previous stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose the port the app runs on
EXPOSE 80

# Command to run the Nginx server
CMD ["nginx", "-g", "daemon off;"]
