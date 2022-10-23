import os

from django.contrib.auth.decorators import login_required
from django.http import Http404, HttpResponse


@login_required
def docs(request):
    current_dir = os.path.dirname(os.path.realpath(__file__))
    docs_path = os.path.join(current_dir, "docs/generated-docs.html")
    try:
        with open(docs_path, "r") as f:
            content = f.read()
    except OSError:
        raise Http404("Page not found")
    else:
        return HttpResponse(content)
