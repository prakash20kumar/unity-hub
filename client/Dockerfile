FROM node:16-alpine AS builder
ENV NODE_ENV production
# Add a work directory
WORKDIR /app
# Cache and Install dependencies
COPY package.json .
COPY npm.lock .
RUN npm install --production
# Copy app files
COPY . .
# Build the app
RUN npm build

# Bundle static assets with nginx
FROM nginx:1.21.0-alpine as production

# Copy built assets from builder
COPY --from=builder /app/build /usr/share/nginx/html
# Add your nginx.conf
# Expose port
EXPOSE 3000
# Start nginx
CMD ["nginx", "-g", "daemon off;"]