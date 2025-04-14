FROM python:3.12-slim

# Install system dependencies (including for wkhtmltopdf)
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
    xfonts-75dpi \
    xfonts-base \
    libxrender1 \
    libxtst6 \
    libxext6 \
    libfontconfig1 \
    libfreetype6 \
    wget \
    && wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bullseye_amd64.deb \
    && dpkg -i wkhtmltox_0.12.6-1.bullseye_amd64.deb || true \
    && apt-get install -f -y \
    && rm wkhtmltox_0.12.6-1.bullseye_amd64.deb \
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

# Start Odoo
CMD ["python", "odoo-bin", "--config=odoo.conf"]
