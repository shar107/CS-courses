#Experiment 2

#1. Write a program (using nitk toolkit in python environment) to tokenize a) Sentence b) A paragraph c) Information of a complete web page


#Solution:


#1(a,b).Tokenize multiple sentences using nltk.

from nltk.corpus import stopwords 
from nltk.tokenize import word_tokenize 
word_data = "It originated from the idea that there are readers who prefer learning 
new skills from the comforts of their drawing rooms"
nltk_tokens = word_tokenize(word_data)
print (nltk_tokens)



#1(c).Tokenize a webpage using nltk.

from nltk.corpus import stopwords 
from nltk.tokenize import word_tokenize 
from urllib import request
url = "http://www.gutenberg.org/files/2554/2554-0.txt"
response = request.urlopen(url)
raw = response.read().decode('utf8')
tokens = word_tokenize(raw)
print(tokens[:10])
