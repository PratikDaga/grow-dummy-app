# Groww Portfolio App

Groww Portfolio App is a simple Flutter application that displays a portfolio of stocks. The app fetches data from a TypeScript backend connected to a PostgreSQL database.

## Features

- Displays a list of stocks with their quantity and price per share.
- Fetches data from a backend server using HTTP requests.
- Simple and clean user interface built with Flutter.

## Tech Stack

- **Frontend**: Flutter, Dart
- **Backend**: TypeScript (without Node.js)
- **Database**: PostgreSQL

## Prerequisites

Before you begin, ensure you have the following installed:

- Flutter SDK: [Flutter installation guide](https://flutter.dev/docs/get-started/install)
- Node.js and npm: [Node.js download](https://nodejs.org/en/download/)
- PostgreSQL: [PostgreSQL download](https://www.postgresql.org/download/)
- An IDE such as Visual Studio Code or Android Studio

## Getting Started

### 1. Set Up the Backend

1. **Create a Project Directory**:
   ```sh
   mkdir groww_backend
   cd groww_backend
2. **Initialize a Node.js Project**:
   npm init -y
3. **Install TypeScript and Required Packages**:
   npm install typescript ts-node @types/node express @types/express pg @types/pg
4. Create a tsconfig.json File
5. Create the Backend Server (index.ts)
6. **Run the Backend Server**:
   npx ts-node index.ts
   
### 2.  Set Up the Database

1. Create the Database and Table

### 3. Set Up the Frontend

1. **Create a Flutter Project**:
   flutter create groww_portfolio_app
   cd groww_portfolio_app
2. Update the pubspec.yaml File
3. Create the Main Flutter App (lib/main.dart)

### 4. Running the Application:

1. **Start the Backend Server**:
   npx ts-node index.ts
2. **Run the Flutter App**:
   flutter run

