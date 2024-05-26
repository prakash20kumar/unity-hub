# Use the official Node.js 14 image as the base image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . ./

# Accept REACT_APP_BASE_URL as a build argument and set it as an environment variable
ARG REACT_APP_BASE_URL
ENV REACT_APP_BASE_URL=${REACT_APP_BASE_URL}


# Build the React application
RUN npm run build

# # Install 'serve' globally
EXPOSE 3000
# Start the app
CMD [ "npm", "start" ]
