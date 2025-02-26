# Use official n8n image
FROM n8nio/n8n

# Install Tesseract OCR
RUN apt-get update && apt-get install -y tesseract-ocr

# Install the community node for OCR
RUN npm install n8n-nodes-tesseractocr

# Set correct permissions
USER root
