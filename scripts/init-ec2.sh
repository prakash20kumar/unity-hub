#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
service docker start
usermod -a -G docker ec2-user

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Create a directory for the app
mkdir -p /home/ec2-user/app
cd /home/ec2-user/app

# Retrieve parameters from SSM
JWT_SECRET=$(aws ssm get-parameter --name "JWT_SECRET" --with-decryption --query "Parameter.Value" --output text)
ACCESS_KEY_ID=$(aws ssm get-parameter --name "ACCESS_KEY_ID" --with-decryption --query "Parameter.Value" --output text)
SECRET_ACCESS_KEY=$(aws ssm get-parameter --name "SECRET_ACCESS_KEY" --with-decryption --query "Parameter.Value" --output text)
BUCKET_NAME=$(aws ssm get-parameter --name "BUCKET_NAME" --query "Parameter.Value" --output text)

# Create .env file
cat <<EOF > .env
MONGODB_URL=${MONGODB_URL}
PORT=8000
JWT_SECRET=${JWT_SECRET}
ACCESS_KEY_ID=${ACCESS_KEY_ID}
SECRET_ACCESS_KEY=${SECRET_ACCESS_KEY}
BUCKET_NAME=${BUCKET_NAME}
EOF

# Docker Compose file
cat <<EOF > docker-compose.yml
version: "3"

services:
  server:
    container_name: server
    image: prakash20kumar2000/mern-server:latest
    restart: always
    ports:
      - "8000:8000"
    env_file:
      - .env

  client:
    container_name: client
    image: prakash20kumar2000/mern-client:latest
    restart: always
    ports:
      - "80:80"
EOF

# Start the Docker containers
docker-compose up -d
