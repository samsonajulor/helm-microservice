# Plans service
- First, make sure you have Node.js and Yarn installed on your system.
- run `yarn` to install dependencies
- run `yarn start` to start the application

Your Express server should now be running on http://localhost:3991. You can use tools like `curl`, Postman, or a web browser to create plans by making POST requests to `http://localhost:3991/plans` with appropriate JSON data (e.g., `{ "title": "Plan 1", "description": "This is the first plan" }`).

You can also retrieve all plans by making a GET request to `http://localhost:3991/plans`.