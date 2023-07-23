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
  res.locals.user = user;

  next();
}

// Protected route
app.post('/auth', authenticateUser, (req: Request, res: Response) => {
  res.json({ message: 'You have accessed a protected route', user: res.locals.user });
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running at http://localhost:${PORT}`);
});
