# Example Dockerfile for React App
FROM node:14-alpine

WORKDIR /app

COPY package.json ./
COPY yarn.lock ./

RUN yarn install

COPY . ./

# Accept REACT_APP_BASE_URL as a build argument and set it as an environment variable
ARG REACT_APP_BASE_URL
ENV REACT_APP_BASE_URL=${REACT_APP_BASE_URL}

# Ensure the React app listens on all network interfaces
ENV HOST 0.0.0.0
ENV PORT 3000

RUN yarn build

CMD ["yarn", "start"]
