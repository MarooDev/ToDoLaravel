# To-Do List in Laravel 11 – Instructions

## Prerequisites
- Docker and Docker Compose installed locally.

## Running in a Docker Environment

1. Copy the files `docker-compose.yml`, `Dockerfile`, `.gitignore`, `.dockerignore` into your repository.

2. Make sure you have an empty `src/` folder (if you want to install Laravel from scratch).

3. Build and start the services to install Laravel:
   ```bash
   docker-compose up -d --build create-laravel app db

4. Start the Node.js service:
   ```bash
   docker-compose up -d node

5. Access the application:

   - Laravel app: [http://localhost:8000](http://localhost:8000)
   - phpMyAdmin: [http://localhost:8080](http://localhost:8080) (Use the credentials: laravel/laravel)
