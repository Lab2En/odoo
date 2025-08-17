FROM python:3.12-bullseye

# System dependencies for Odoo and wkhtmltopdf
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
    wkhtmltopdf \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=C.UTF-8

WORKDIR /opt/odoo

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8069

CMD ["python", "odoo-bin", "--config=odoo.conf"]
