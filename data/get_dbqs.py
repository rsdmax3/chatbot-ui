import os
import requests
from bs4 import BeautifulSoup
import urllib.parse

# Create a sub-folder to store the PDFs
subfolder = "va_dbq_pdfs"
if not os.path.exists(subfolder):
    os.makedirs(subfolder)

# URL of the page
url = "https://www.benefits.va.gov/compensation/dbq_publicdbqs.asp"

# Fetch the page content
response = requests.get(url)
soup = BeautifulSoup(response.content, 'html.parser')

# Find all links
links = soup.find_all('a')

# Base URL for relative links
base_url = "https://www.benefits.va.gov"

# Counter for PDF files
pdf_count = 0

# Download PDF files
for link in links:
    href = link.get('href')
    if href and href.lower().endswith('.pdf'):
        # If it's a relative URL, make it absolute
        if not href.startswith('http'):
            href = urllib.parse.urljoin(base_url, href)

        # Get the filename from the URL
        filename = os.path.join(subfolder, href.split('/')[-1])

        # Download the file
        pdf_response = requests.get(href)
        with open(filename, 'wb') as f:
            f.write(pdf_response.content)

        pdf_count += 1
        print(f"Downloaded: {filename}")

print(f"\nTotal PDF files downloaded: {pdf_count}")
