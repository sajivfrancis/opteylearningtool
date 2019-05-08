from django.shortcuts import render
from nltk.tokenize import RegexpTokenizer
import nltk
import plotly.io as pio
import plotly
import plotly.plotly as py
import plotly.graph_objs as go
import re
import numpy as np
from PIL import Image
from os import path
import matplotlib.pyplot as plt
import os
import random
from wordcloud import WordCloud, STOPWORDS
from django.http import HttpResponse
from xhtml2pdf import pisa
import base64
stop_words = ["‘","|","|","(","-",")","#","don't","'",".",",","does","said","saying","lot","great","mean","'m",":",";","'s","'ve","`","´","'´","``","'re","did","s","?","]","[","'11","'ll","--","''","n't","ll","know","just","0","00","1","01","02","03","2005","2015","04","05","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","E","The","xc2","xa0","xc","x90","x8c","xec","N","T","U","x94","x93","000","x9c","xa6","This","nTeam","n4","A","S","used","sprice","nselect","nwhere","use","nThe","xa2","x80","xe80","What","b","x99s","xe2","m","It","think","course","So","actually","people","going","really","I", "s","n","t","a", "about", "above", "above", "across", "after", "afterwards", "again", "against", "all", "almost", "alone", "along", "already", "also","although","always","am","among", "amongst", "amoungst", "amount",  "an", "and", "another", "any","anyhow","anyone","anything","anyway", "anywhere", "are", "around", "as",  "at", "back","be","became", "because","become","becomes", "becoming", "been", "before", "beforehand", "behind", "being", "below", "beside", "besides", "between", "beyond", "bill", "both", "bottom","but", "by", "call", "can", "cannot", "cant", "co", "con", "could", "couldnt", "cry", "de", "describe", "detail", "do", "done", "down", "due", "during", "each", "eg", "eight", "either", "eleven","else", "elsewhere", "empty", "enough", "etc", "even", "ever", "every", "everyone", "everything", "everywhere", "except", "few", "fifteen", "fify", "fill", "find", "fire", "first", "five", "for", "former", "formerly", "forty", "found", "four", "from", "front", "full", "further", "get", "give", "go", "had", "has", "hasnt", "have", "he", "hence", "her", "here", "hereafter", "hereby", "herein", "hereupon", "hers", "herself", "him", "himself", "his", "how", "however", "hundred", "ie", "if", "in", "inc", "indeed", "interest", "into", "is", "it", "its", "itself", "keep", "last", "latter", "latterly", "least", "less", "ltd", "made", "many", "may", "me", "meanwhile", "might", "mill", "mine", "more", "moreover", "most", "mostly", "move", "much", "must", "my", "myself", "name", "namely", "neither", "never", "nevertheless", "next", "nine", "no", "nobody", "none", "noone", "nor", "not", "nothing", "now", "nowhere", "of", "off", "often", "on", "once", "one", "only", "onto", "or", "other", "others", "otherwise", "our", "ours", "ourselves", "out", "over", "own","part", "per", "perhaps", "please", "put", "rather", "re", "same", "see", "seem", "seemed", "seeming", "seems", "serious", "several", "she", "should", "show", "side", "since", "sincere", "six", "sixty", "so", "some", "somehow", "someone", "something", "sometime", "sometimes", "somewhere", "still", "such", "system", "take", "ten", "than", "that", "the", "their", "them", "themselves", "then", "thence", "there", "thereafter", "thereby", "therefore", "therein", "thereupon", "these", "they", "thickv", "thin", "third", "this", "those", "though", "three", "through", "throughout", "thru", "thus", "to", "together", "too", "top", "toward", "towards", "twelve", "twenty", "two", "un", "under", "until", "up", "upon", "us", "very", "via", "was", "we", "well", "were", "what", "whatever", "when", "whence", "whenever", "where", "whereafter", "whereas", "whereby", "wherein", "whereupon", "wherever", "whether", "which", "while", "whither", "who", "whoever", "whole", "whom", "whose", "why", "will", "with", "within", "without", "would", "yet", "you", "your", "yours", "yourself", "yourselves", "the","it","there","I'm","thing","that", "we're","they're","that'"]
paragraph_stop_words = ["\\n","xc2","xa0","xc","\\"]
paragraphTextInfo = ""

def createWordCloud(text,file):
    wc = WordCloud(max_words=25, stopwords=set(stop_words), margin=10,random_state=0).generate(text)
    wc.to_file(file.file.path+".wordcloud.png")
    return png2Base(file.file.path+".wordcloud.png")

# create a base64-path out of files (used for png)
def png2Base(path):
    with open(path, "rb") as image_file:
        encoded_string = base64.b64encode(image_file.read())
        return "data:image/png;base64,"+encoded_string.decode("utf-8")

# Highscore for frequent words. first argument is the frequency, next how many places there are
def getHighest(freq,maxHighscore):
    keyArray = []
    valArray = []
    highestVal = 0
    lowestValue = 0
    highestWord = ''
    wPos = 0
    while(wPos < maxHighscore):
        for key,val in freq.items():
            if((val>=highestVal) & ((val <lowestValue)|(lowestValue==0))):
                highestVal = val
                highestWord = key
        freq.__delitem__(highestWord)
        if(highestVal>0):
            keyArray.append(highestWord)
            valArray.append(highestVal)
            lowestValue = highestVal
            highestVal = 0
        wPos+=1
    return [keyArray,valArray]

# half-deprecated method
def getFreqByText(text,ignoreStopWords = False):
    return nltk.FreqDist(getTokens(text,ignoreStopWords))

# get the tokens/words only.
def getTokens(text,ignoreStopWords = False):

    # RegexpTokenizer-method
    #tokenizer = RegexpTokenizer(r'\w+')
    #tokens = tokenizer.tokenize(text)

    # Word-tokenize-method
    tokens = nltk.tokenize.word_tokenize(text)

    # End split to words

    # Start filter out stopWords
    filtered_sentence = [w for w in tokens if not w in stop_words]
    filtered_sentence = []
    for w in tokens:
        if w not in stop_words or ignoreStopWords:
            filtered_sentence.append(w)
    return filtered_sentence

def convert_html_to_pdf(source_html, output_filename):
    result_file = open(output_filename, "w+b")
    pisa_status = pisa.CreatePDF(source_html,dest=result_file)
    result_file.close()
    return pisa_status.err

def home(request):
    print("do it")
    try:
        file = File.objects.latest('uploaded_at')
    except:
        file = None
    if file is not None:
        text = textract.process(file.file.path.replace('/file/','/')).decode("utf-8")
        wcDivData = plotly.offline.plot(processData(text, "wc"), auto_open=True,image='jpeg',output_type='div')
        hbDivData = plotly.offline.plot(processData(text, "hb"), auto_open=True,image='jpeg',output_type='div')
        psDivData = plotly.offline.plot(processData(text, "ps"), auto_open=True,image='jpeg',output_type='div')
        scDivData = plotly.offline.plot(processData(text, "sc"), auto_open=True,image='jpeg',output_type='div')
        percentageDivData = plotly.offline.plot(processData(text, "percentage"), auto_open=True,image='jpeg',output_type='div')
        return render(request, 'portal.html', {'wordcloud':'<img width="100%" src="'+createWordCloud(text,file)+'">','paraChart':psDivData,'chart1': wcDivData,'chart2':percentageDivData,'chart3': scDivData, 'file':file})
    else:
        return render(request, 'portal.html', {'file':None})

def content(request):
    files_list = File.objects.all()
    return render(request, 'content.html', {'files': files_list})

def uploads(request):
    template="uploads.html"
    context={}
    return render(request,template,context)

def reports(request):
    files_list = File.objects.all()
    return render(request, 'reports.html', {'files': files_list})

def settings(request):
    template="settings.html"
    context={}
    return render(request,template,context)

from django.http import JsonResponse
from django.views import View

from .forms import FileForm
from .models import File
import textract

class FileUploadView(View):
    def get(self, request):
        files_list = File.objects.all()
        return render(self.request, 'portal/file_upload/index.html', {'files': files_list})

    def post(self, request):
        form = FileForm(self.request.POST, self.request.FILES)
        if form.is_valid():
            file = form.save()
            file.text = textract.process(file.file.path).decode("utf-8")
            file.save()
            data = {'is_valid': True, 'name': file.file.name, 'url': file.file.url}
        else:
            data = {'is_valid': False}
        return JsonResponse(data)

from django.shortcuts import render, redirect
def edit(request, id):
     file = File.objects.get(id=id)
     return render(request,'portal/preview.html', {'file':file})

################## PROCESS DATA & OUTPUT PLOTLY CHARTS#############################
paragraphTextInfo = ""
def processData(text, chartType):
     if((chartType == "wc") | (chartType == "Word Count")):
         print("BAR CHART")
         freq = getFreqByText(text)
         #Frequency into Templates --> https://gist.github.com/reidransom/a397cd2fb7d489ef3049
         data = getHighest(freq,5)
         return [go.Bar(
                x=data[0],
                y=data[1]
         )]

     elif((chartType == "percentage") | (chartType == "Words by Percentage")):
         print("PIE CHART!")
         freq = getFreqByText(text)
         #Frequency into Templates --> https://gist.github.com/reidransom/a397cd2fb7d489ef3049
         data = getHighest(freq,5)
         return [go.Pie(labels=data[0], values=data[1])]
     #return data
     elif((chartType == "sc") | (chartType == "Scatter Representation")):
         print("SCATTER CHART")
         freq = getFreqByText(text)
         #Frequency into Templates --> https://gist.github.com/reidransom/a397cd2fb7d489ef3049
         data = getHighest(freq,25)
         return [go.Scatter(
                x=data[0],
                y=data[1],
                mode = 'markers'
         )]
     elif((chartType == "ps") | (chartType == "Paragraph scatter")):
         print("Paragraph SCATTER CHART")
         tokenized_sentences=text.split("\n\n")
         keyArray = []
         valArray = []
         highestVal = 0
         lowestValue = 0
         highestWord = ''
         wPos = 0
         tokenizer = RegexpTokenizer(r'\w+')
         global paragraphTextInfo
         while(wPos < 5):
             for key in tokenized_sentences:
                 words=nltk.tokenize.word_tokenize(key)
                 filtered_sentence = [w for w in words if not w in stop_words]
                 filtered_sentence = []
                 for w in words:
                    if w not in paragraph_stop_words:
                        filtered_sentence.append(w)
                 val = len(filtered_sentence)
                 for stopWord in paragraph_stop_words:
                     key = key.replace(stopWord, '')
                 words=nltk.tokenize.word_tokenize(key)
                 val = len(words)
                 if((val>highestVal) & ((val <lowestValue)|(lowestValue==0))):
                     highestVal = val
                     highestWord = key
             if(highestVal>0):
                 paragraphTextInfo += "<li><b>Paragraph</b> : "+highestWord+" <b>has "+str(highestVal)+" words.</b></li>"
                 keyArray.append(highestWord)
                 valArray.append(highestVal)
                 lowestValue = highestVal
                 highestVal = 0
             wPos+=1
         return [go.Bar(x=keyArray,y=valArray)]
     elif((chartType == "ds") | (chartType == "Document statistics")):
         sentenceCount = len(nltk.sent_tokenize(text))
         paragraphCount=len(text.split("\n\n"))
         tokenizer = RegexpTokenizer(r'\w+')
         tokens = tokenizer.tokenize(text)
         filtered_sentence = [w for w in tokens if not w in stop_words]
         filtered_sentence = []
         for w in tokens:
             filtered_sentence.append(w)
         wordCount = len(filtered_sentence)
         charCount = len(text)
         keyArray = []
         keyArray.append("Words")
         keyArray.append("Sentences")
         keyArray.append("Paragraphs")
         valArray = []
         valArray.append(wordCount)
         valArray.append(sentenceCount)
         valArray.append(paragraphCount)

         return [go.Bar(
                x=keyArray,
                y=valArray,
         )]
     #return data
     elif((chartType == "hb") | (chartType == "Horizontal Bar")):
         print("HORIZONTAL BAR")
         freq = getFreqByText(text)
         data = getHighest(freq,5)
         return [go.Bar(
                x=data[0],
                y=data[1],
                orientation = 'h'
         )]

def downloadPreview(request, id):
     global paragraphTextInfo
     file = File.objects.get(id=id)
     text = textract.process(file.file.path.replace('/file/','/')).decode("utf-8")
     paragraphTextInfo = ""
     chartType = request.POST.get("chartType", "")
     if((chartType == "sum") | (chartType == "Summarized Report")):
         wcDivData = plotly.offline.plot(processData(text, "wc"), auto_open=True,image='jpeg',output_type='div')
         hbDivData = plotly.offline.plot(processData(text, "hb"), auto_open=True,image='jpeg',output_type='div')
         scDivData = plotly.offline.plot(processData(text, "sc"), auto_open=True,image='jpeg',output_type='div')
         psDivData = plotly.offline.plot(processData(text, "ps"), auto_open=True,image='jpeg',output_type='div')
         percentageDivData = plotly.offline.plot(processData(text, "percentage"), auto_open=True,image='jpeg',output_type='div')
         dsDivData = plotly.offline.plot(processData(text, "ds"), auto_open=True,image='jpeg',output_type='div')
         divData = "<center><h2>Summarized Reports</h2></center>    <p><img width='100%' src='"+ createWordCloud(text,file) +"' /></p><h3>Word count</h3>"+wcDivData+"<h3>Horizontal Bars</h3>"+hbDivData+"<h3>Scatter</h3>"+scDivData+"<h3>Paragraph Word count</h3><p>"+paragraphTextInfo+"</p>"+psDivData+"<h3>Percentage</h3>"+percentageDivData+"<h3>Document statistics</h3>"+dsDivData
     elif ((chartType == "pt")|(chartType == "Paragraph text")):
         processData(text, "ps")
         divData = '<h1>Paragraph-text</h1><p>'+paragraphTextInfo+'</p>'
     elif ((chartType == "wordcloud")|(chartType == "Collage Representation")):
         divData = '<center><h2>Collage Representation</h2></center><img width="100%" src="'+createWordCloud(text,file)+'">'

     else:
         data = processData(text, chartType)
         divData = plotly.offline.plot(data, auto_open=True,image='jpeg',output_type='div')
     return render(request,'downloadPreview.html', {'chartHtml':divData,'file':file,'chartType':chartType})

def download(request, id, chartType):
     global paragraphTextInfo
     file = File.objects.get(id=id)
     text = textract.process(file.file.path.replace('/file/','/')).decode("utf-8")
     paragraphTextInfo = ""
     # theHtml for pdf-export
     theHtml = "<html><head><style>.h3 { font-size: 26px; font-weight: 800; text-align: center; }</style><style>.h1 { font-size: 32px; font-weight: 1200; text-align: center; }</style></head><body>"
     if((chartType == "sum") | (chartType == "Summarized Report")):
         print("Summarized Report!")
         wordCloudHtml = "<p><img style='width:512pt' src='"+ createWordCloud(text,file) +"' /></p>"
         pio.write_image(go.Figure(data=processData(text, "wc")), file.file.path+".wc.img.png")
         pio.write_image(go.Figure(data=processData(text, "hb")), file.file.path+".hb.img.png")
         pio.write_image(go.Figure(data=processData(text, "sc")), file.file.path+".sc.img.png")
         pio.write_image(go.Figure(data=processData(text, "ps")), file.file.path+".ps.img.png")
         pio.write_image(go.Figure(data=processData(text, "ds")), file.file.path+".ds.img.png")
         pio.write_image(go.Figure(data=processData(text, "percentage")), file.file.path+".percentage.img.png")

         theHtml += "<p class='h1'>Reports</p><p><img style='width:512pt' src='"+ createWordCloud(text,file) +"' /></p>"
         theHtml += "<p><img style='width:256pt' src='"+ png2Base(file.file.path+".wc.img.png") +"' />"
         theHtml += "<img style='width:256pt' src='"+ png2Base(file.file.path+".hb.img.png") +"' /></p>"
         theHtml += "<p><img style='width:256pt' src='"+ png2Base(file.file.path+".percentage.img.png") +"' />"
         theHtml += "<img style='width:256pt' src='"+ png2Base(file.file.path+".ds.img.png") +"' /></p>"
         #END of first page

         # do the rest of the pages (each page one line)
         theHtml += "<pdf:nextpage><p class='h3'>Word count</p><p><img src='"+ png2Base(file.file.path+".wc.img.png") +"' /></p>"
         theHtml += "<pdf:nextpage><p class='h3'>Horizontal Bar</p><p><img src='"+ png2Base(file.file.path+".hb.img.png") +"' /></p>"
         theHtml += "<pdf:nextpage><p class='h3'>Scatter</p><p><img src='"+ png2Base(file.file.path+".sc.img.png") +"' /></p>"
         theHtml += "<pdf:nextpage><p class='h3'>Paragraph Word-Count</p><p>"+paragraphTextInfo+"</p><p><img src='"+ png2Base(file.file.path+".ps.img.png") +"' /></p>"
         theHtml += "<pdf:nextpage><p class='h3'>Percentage</p><p><img src='"+ png2Base(file.file.path+".percentage.img.png") +"' /></p>"
         theHtml += "<pdf:nextpage><p class='h3'>Document statistics</p><p><img src='"+ png2Base(file.file.path+".ds.img.png") +"' /></p>"
         theHtml += "<p><img style='width:512pt' src='"+ createWordCloud(text,file) +"' /></p>"
     elif ((chartType == "pt")|(chartType == "Paragraph text")):
         processData(text, "ps")
         theHtml += '<p class="h1">Paragraph-text</p><p>'+paragraphTextInfo+'</p>'

     elif ((chartType == "wordcloud")|(chartType == "Collage Representation")):
         theHtml += '<p class="h1">Collage Representation</p><p><img style="width:512pt" src="'+ createWordCloud(text,file) +'" /></p>'

     else:
         # Analysis
         data = processData(text, chartType)
         print(file.file.path+".img.png")
         fig = go.Figure(data=data)
         # PNG will be inserted into PDF
         print(pio.write_image(fig, file.file.path+".img.png"))
         theHtml += "<p class='h1'>Report ("+chartType+")</p>"
         theHtml += "<p><img src='"+png2Base(file.file.path+".img.png") +"' /></p>"
     theHtml += "</body></html>"

     # Differ between single charts and summarzied charts
     convert_html_to_pdf(theHtml, file.file.path+".pdf")
     pdfStream = open(file.file.path+".pdf", 'rb')
     response = HttpResponse(pdfStream, content_type='application/pdf')
     response['Content-Disposition'] = 'inline; filename=Report.pdf'.format(
        title="Report.pdf",
        from_=1,
        to=1)
     return response

def update(request, id):
     file = file.objects.get(id=id)
     form = fileForm(request.POST, instance = file)
     if form.is_valid():
         form.save()
         return redirect("/show")
     return render(request, 'edit.html', {'file': file})
def destroy(request, id):
     file = File.objects.get(id=id)
     file.delete()
     return redirect("/")
