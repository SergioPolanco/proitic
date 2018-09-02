from django.shortcuts import render
from investigator import models as investigator_model
from testimony import models as testimony_model
# Create your views here.
def index_view(request, *args, **kwargs):
    idInvestigator = kwargs['investigator']
    investigator_list = investigator_model.Investigator.objects.all().order_by('nombres')
    investigator_info = investigator_model.Investigator.objects.get(id=idInvestigator)
    testimony_list = testimony_model.Testimony.objects.all().order_by('-id')[:20]
    template_testimony_list1 = testimony_list[:len(testimony_list)/2]
    template_testimony_list2 = testimony_list[len(testimony_list)/2:]
    context = {
        'investigator_list': investigator_list,
        'testimony_list1': template_testimony_list1,
        'testimony_list2': template_testimony_list2,
        'investigator_info': investigator_info
    }
    return render(request, 'profile.html', context)
