from django.shortcuts import render

# Create your views here.
def error_404(request):
    return render(request,'error_404/error_404.html')

def error_500(request):
    return render(request,'error500/error_500.html')