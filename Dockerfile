# Use n8n base image
FROM n8nio/n8n:latest

# Set working directory
WORKDIR /app

# Install required dependencies for Tesseract
RUN apk add --no-cache \
    autoconf \
    automake \
    libleptonica \
    libleptonica-dev \
    tesseract-ocr \
    tesseract-ocr-dev \
    git \
    make \
    g++ \
    pkgconfig \
    libtool

# Clone Tesseract OCR from GitHub and build it
RUN git clone --depth 1 https://github.com/tesseract-ocr/tesseract.git /tesseract && \
    cd /tesseract && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    ldconfig

# Install the n8n community node for Tesseract OCR
RUN npm install n8n-nodes-tesseractocr

# Set correct permissions
USER node
