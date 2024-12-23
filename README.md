# Laravel To-Do Application with Docker

This guide explains how to set up a Laravel application in a Dockerized environment, ensuring that services start in sequence and wait for the completion of the previous step.

---

## Prerequisites
- Install Docker and Docker Compose locally.

---

## Setup Steps

1. Copy Required Files
Copy the following files into your repository:
- `docker-compose.yml`
- `Dockerfile`
- `.gitignore`
- `.dockerignore`

2. Ensure an Empty `src/` Folder
Ensure the `src/` folder is empty if you want to install Laravel from scratch. This folder will store the Laravel project files.

3. Build and Start app

   ```bash
   docker-compose up -d --build app
4.  Build and Start db (Mysql)
    ```bash
    docker-compose up -d --build db
5.  Build and Start phpmyadmin 
    ```bash
    docker-compose up -d --build phpmyadmin 
6.  Install Laravel
    ```bash
    docker-compose up -d --build create-laravel
7.  Build and Start Node
    ```bash
    docker-compose up -d --build node
8. Access the application:

   - Laravel app: [http://localhost:8000](http://localhost:8000)
   - phpMyAdmin: [http://localhost:8080](http://localhost:8080) (Use the credentials: laravel/laravel)
