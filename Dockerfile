FROM python:3.12-slim

# System dependencies for Odoo
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libxml2-dev \
    libxslt-dev \
    libldap2-dev \
    libsasl2-dev \
    libpq-dev \
    libffi-dev \
    libjpeg-dev \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libxmlsec1-dev \
    locales \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV LANG=C.UTF-8

# Create a working directory
WORKDIR /opt/odoo

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your Odoo source
COPY . .

# Expose the port
EXPOSE 8069

COPY odoo.conf /etc/odoo/odoo.conf
# Start Odoo
CMD ["python", "odoo-bin", "--config=/etc/odoo/odoo.conf"]
