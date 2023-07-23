

Sure! Below is a simple Express application that allows users to create plans without using a database. This example uses TypeScript and Yarn.

Follow the steps below to create the application:

Step 1: Initialize the project and install dependencies

Open your terminal and run the following commands:

```bash
# Create a new directory for your project
mkdir plan-service

# Move into the newly created directory
cd plan-service

# Initialize a new Node.js project with TypeScript support
yarn init -y
yarn add express @types/express typescript ts-node-dev
```

Step 2: Create the application files

Create a new file named `app.ts` in the project root directory and add the following code:

```typescript
import express, { Request, Response } from 'express';

const app = express();
const PORT = 3991;

// Middleware to parse incoming JSON data
app.use(express.json());

// In-memory storage for plans (for simplicity)
const plans: any[] = [];

// Route to create a new plan
app.post('/plans', (req: Request, res: Response) => {
  const { title, description } = req.body;

  if (!title || !description) {
    return res.status(400).json({ message: 'Title and description are required' });
  }

  // Generate a unique ID for the plan (you can use a library like 'uuid' in a real-world scenario)
  const id = Math.random().toString(36).substr(2, 9);

  // Create the new plan object
  const newPlan = { id, title, description };

  // Store the plan in the in-memory array
  plans.push(newPlan);

  res.status(201).json(newPlan);
});

// Route to get all plans
app.get('/plans', (req: Request, res: Response) => {
  res.json(plans);
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
  "name": "plan-service",
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

Your Express server should now be running on http://localhost:3991. You can use tools like `curl`, Postman, or a web browser to create plans by making POST requests to `http://localhost:3991/plans` with appropriate JSON data (e.g., `{ "title": "Plan 1", "description": "This is the first plan" }`).

You can also retrieve all plans by making a GET request to `http://localhost:3991/plans`.