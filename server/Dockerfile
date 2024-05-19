# Use the official Node.js 14 image
FROM node:14

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the application port
EXPOSE $PORT

# Set environment variables
ENV MONGO_URL=$MONGO_URL
ENV PORT=$PORT
ENV JWT_SECRET=$JWT_SECRET
ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
ENV BUCKET_NAME=$BUCKET_NAME

# Start the application
CMD ["npm", "start"]
