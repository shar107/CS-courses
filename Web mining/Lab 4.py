#Experiment 4: Beautiful Soup


#‣ Extracting Image URLs (IMG TAG) from vit.ac.in

from urllib.request import urlopen
from bs4 import BeautifulSoup
import re
URL = 'https://vit.ac.in/'
page = urlopen(URL)
soup = BeautifulSoup(page, 'html.parser')
results = soup.findAll('img',{'src':re.compile('.jpg')})
for image in results:
 print(image['src'] + '\n')



#‣ Extracting URLs to other websites (HREF TAG) from vit.ac.in

from bs4 import BeautifulSoup
import requests
url = "https://vit.ac.in/"
response = requests.get(url)
data = response.text
soup = BeautifulSoup(data, 'lxml')
tags = soup.find_all('a')
for tag in tags:
 print(tag.get('href'))



#‣ Extracting paragraphs (P tag) from vit.ac.in

import urllib.request 
from bs4 import BeautifulSoup
url = "https://vit.ac.in/"
html = urllib.request.urlopen(url)
htmlParse = BeautifulSoup(html, 'html.parser')
for para in htmlParse.find_all("p"):
 print(para.get_text())



#‣ Extracting Header tags from vit.ac.in

from urllib.request import urlopen
from bs4 import BeautifulSoup
html=urlopen('https://vit.ac.in')
bs=BeautifulSoup(html, 'html.parser')
titles=bs.find_all(['h1','h2','h3','h4','h5','h6'])
print("All the header tags extracted from vit.ac.in: \n",*titles,sep='\n\n')



#‣ Extracting all title tags from vit.ac.in

from urllib.request import urlopen
from bs4 import BeautifulSoup
html=urlopen('https://vit.ac.in')
bs=BeautifulSoup(html, 'html.parser')
print(bs.find('title'))



#‣ Count the number of paragraph tags of an HTML document

from lxml import html
import requests
pg=requests.get(input('Enter URL: '))
rt=html.fromstring(pg.content)
print("No. of paragraph tags present in HTML source code of the given URL area: ",end='')
print(len(rt.xpath('//p')))



#‣ Find the length of the text of the first <h1> tag of a given HTML document

from urllib.request import urlopen
from bs4 import BeautifulSoup
html=urlopen('https://vit.ac.in')
bs=BeautifulSoup(html, 'html.parser')
title=bs.find_all(['h1'])
print("First h1 tag: "+ str(title[0])+"\n")
print("Length of the text of the first <h1> tag of a given html source code (URL 
source code): ", end='')
print(len(str(title[0]))-9)
