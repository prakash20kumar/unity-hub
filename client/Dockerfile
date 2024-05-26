# Use the official Node.js 14 image as the base image
FROM node:14-alpine AS build

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --silent

# Copy the rest of the application source code to the working directory
COPY . .

# Build the React application
RUN npm run build

# Use a lightweight web server to serve the static files
FROM node:14-alpine

# Install serve to serve the build directory
RUN npm install -g serve

# Copy the build output to the new image
COPY --from=build /usr/src/app/build /usr/src/app/build

# Expose port 3000
EXPOSE 3000

# Serve the application
CMD ["serve", "-s", "build", "-l", "3000"]
