from django.urls import path
from portal import views
from django.conf import settings
from django.conf.urls import url, include
from django.conf.urls.static import static
from django.views.generic import TemplateView
from django.conf.urls.static import static
app_name = 'portal'

urlpatterns = [
    path('portal/', views.home, name='portal'),
    path('content/', views.content, name='content'),
    path('uploads/', views.uploads, name='uploads'),
    path('reports/', views.reports, name='reports'),
    path('settings/', views.settings, name='settings'),
    path('edit/<int:id>', views.edit),
    path('download/<int:id>/<str:chartType>', views.download),
    path('downloadPreview/<int:id>', views.downloadPreview),
    path('delete/<int:id>', views.destroy),
    url(r'^file-upload/$', views.FileUploadView.as_view(), name='file_upload'),

    # CRUD - CREATE, READ, UPDATE, DELETE
    # path('file', views.file),
    # path('show',views.show),
    # path('edit/<int:id>', views.edit),
    #path('update/<int:id>', views.update),
    # path('delete/<int:id>', views.destroy),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
