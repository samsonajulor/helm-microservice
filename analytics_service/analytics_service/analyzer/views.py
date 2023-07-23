from django.shortcuts import render
from .models import get_common_metrics

def metrics_view(request):
    total_users, total_plans = get_common_metrics()
    return render(request, 'metrics.html', {'total_users': total_users, 'total_plans': total_plans})
