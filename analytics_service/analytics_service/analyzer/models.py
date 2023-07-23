# from django.db import models

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

