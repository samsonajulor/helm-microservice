
First, make sure you have Node.js and Yarn installed on your system. Then, follow these steps to create the application:

Step 1: Initialize the project and install dependencies

Open your terminal and run the following commands:

```bash
# Create a new directory for your project
mkdir authentication-service

# Move into the newly created directory
cd authentication-service

# Initialize a new Node.js project with TypeScript support
yarn init -y
yarn add express @types/express typescript ts-node-dev
```

Step 2: Create the application files

Create a new file named `app.ts` in the project root directory and add the following code:

```typescript
import express, { Request, Response, NextFunction } from 'express';

const app = express();
const PORT = 3990;

// Hardcoded user data (for simplicity)
const users = [
  {
    username: 'user1',
    password: 'password1',
    id: '1',
  },
  {
    username: 'user2',
    password: 'password2',
    id: '2',
  },
];

// Middleware to parse incoming JSON data
app.use(express.json());

// Middleware to authenticate user
function authenticateUser(req: Request, res: Response, next: NextFunction) {
  const { username, password } = req.body;

  // Simulating user lookup in the database
  const user = users.find((u) => u.username === username && u.password === password);

  if (!user) {
    return res.status(401).json({ message: 'Authentication failed' });
  }

  // Attach the authenticated user to the request object
  req.user = user;

  next();
}

// Protected route
app.get('/protected', authenticateUser, (req: Request, res: Response) => {
  res.json({ message: 'You have accessed a protected route', user: req.user });
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running at http://localhost:${PORT}`);
});
```

Step 3: Configure the TypeScript compiler

Create a `tsconfig.json` file in the project root directory with the following content:

```json
{
  "compilerOptions": {
    "target": "ES6",
    "module": "commonjs",
    "outDir": "dist",
    "strict": true,
    "esModuleInterop": true,
  },
  "include": ["app.ts"],
  "exclude": ["node_modules"]
}
```

Step 4: Update the package.json

Update the `package.json` file to include the scripts for running the application:

```json
{
  "name": "authentication-service",
  "version": "1.0.0",
  "scripts": {
    "start": "ts-node-dev --respawn --transpile-only app.ts"
  },
  "dependencies": {
    "express": "^4.17.1",
    "@types/express": "^4.17.11",
    "typescript": "^4.4.3",
    "ts-node-dev": "^1.1.8"
  }
}
```

Step 5: Start the application

Start the application by running the following command in the terminal:

```bash
yarn start
```

Your Express server should now be running on http://localhost:3990. You can use tools like `curl`, Postman, or a web browser to make requests to the protected route with appropriate JSON data (e.g., `{ "username": "user1", "password": "password1" }`).