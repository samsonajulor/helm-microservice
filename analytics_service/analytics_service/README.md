To create a simple Django application that analyzes a list of users and plans without using a database, we'll use Django's in-memory data structures like lists and dictionaries. We'll then display common metrics to the frontend using Django's views and templates. Follow the steps below to create the application:

Step 1: Install Django

Make sure you have Python installed on your system. Then, create a new virtual environment and install Django:

```bash
# Create a new virtual environment (optional but recommended)
python -m venv venv
source venv/bin/activate  # On Windows, use: venv\Scripts\activate

# Install Django
pip install django
```

Step 2: Create the Django project and app

```bash
helm-admin startproject user_plan_analysis
cd user_plan_analysis
python manage.py startapp analyzer
```

Step 3: Define the data and analysis functions

Open the `analyzer/models.py` file and define the data structures and analysis functions. For simplicity, we'll use Python lists and dictionaries to store users and plans:

```python
# analyzer/models.py

users = [
    {'id': 1, 'name': 'John Doe'},
    {'id': 2, 'name': 'Jane Smith'},
    # Add more users as needed
]

plans = [
    {'id': 1, 'title': 'Plan 1', 'description': 'This is the first plan'},
    {'id': 2, 'title': 'Plan 2', 'description': 'This is the second plan'},
    # Add more plans as needed
]

def get_user_by_id(user_id):
    return next((user for user in users if user['id'] == user_id), None)

def get_plan_by_id(plan_id):
    return next((plan for plan in plans if plan['id'] == plan_id), None)

def get_common_metrics():
    total_users = len(users)
    total_plans = len(plans)
    return total_users, total_plans
```

Step 4: Define views and templates

Open the `analyzer/views.py` file and create a view function that computes the common metrics and renders them in a template:

```python
# analyzer/views.py

from django.shortcuts import render
from .models import get_common_metrics

def metrics_view(request):
    total_users, total_plans = get_common_metrics()
    return render(request, 'metrics.html', {'total_users': total_users, 'total_plans': total_plans})
```

Step 5: Create the template

Create a new directory named `templates` inside the `analyzer` app directory. Then, create a new file named `metrics.html` inside the `templates` directory and add the following content:

```html
<!DOCTYPE html>
<html>
<head>
    <title>User and Plan Metrics</title>
</head>
<body>
    <h1>Common Metrics</h1>
    <p>Total Users: {{ total_users }}</p>
    <p>Total Plans: {{ total_plans }}</p>
</body>
</html>
```

Step 6: Configure URLs

Open the `user_plan_analysis/urls.py` file and configure the URL for the metrics view:

```python
from django.contrib import admin
from django.urls import path
from analyzer.views import metrics_view

urlpatterns = [
    path('admin/', admin.site.urls),
    path('metrics/', metrics_view, name='metrics'),
]
```

Step 7: Run the server

Start the development server and view the metrics page in your web browser:

```bash
python manage.py runserver
```

Visit `http://127.0.0.1:8000/metrics/` in your web browser, and you should see the total number of users and plans displayed on the page.