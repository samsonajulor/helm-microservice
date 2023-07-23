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
