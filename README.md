# Client Authentication API with Role-Based Permissions

## Overview

This project provides API authentication using **Client ID** and **Client Secret**, with role-based permissions to grant specific API access to different clients.

---

## Features

- Client authentication with Client ID and Client Secret
- Role-based access control (RBAC) with permissions
- CRUD operations on Products and Categories
- Dynamic permission checks for each API route
- Seeders for initial clients, roles, permissions, products, and categories

---

## Setup

1. repository:

  ```bash
  git clone <your-repo-url>
  cd <your-project-folder>

2. Environment variables:

  DB_USER=your_db_user
  DB_PASSWORD=your_db_password
  DB_HOST=localhost
  DB_NAME=your_db_name
  DB_PORT=5432
  PORT=5000
  IS_ROLE_PERMISSION=true


3. Install dependencies:

  ```bash
  npm install


4. Run migrations and seeders:

  ```bash
  npm run start
  ```bash
  npm run dev


Authentication
Every API request must include headers:
x-client-id: your_client_id
x-client-secret: your_client_secret






