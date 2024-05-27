# Fetching the latest node image on Alpine Linux
FROM node:alpine AS builder

# Setting up the work directory
WORKDIR /app

# Installing dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copying all the files in our project
COPY . .

# Building our application
RUN npm run build

# Fetching the latest nginx image
FROM nginx:alpine

# Copying built assets from builder
COPY --from=builder /app/build /usr/share/nginx/html

# Adding a command to replace the placeholder in the static files with the actual backend IP address
CMD ["/bin/sh", "-c", "envsubst '\$REACT_APP_BASE_URL' < /usr/share/nginx/html/index.html > /usr/share/nginx/html/index_temp.html && mv /usr/share/nginx/html/index_temp.html /usr/share/nginx/html/index.html && nginx -g 'daemon off;'"]
