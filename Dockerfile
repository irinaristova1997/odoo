FROM python:3.12-slim

WORKDIR /opt/odoo

RUN apt-get update && apt-get install -y \
    git \
    gcc \
    libldap2-dev \
    libsasl2-dev \
    libpq-dev \
    libxml2-dev \
    libxslt1-dev \
    libjpeg-dev \
    libffi-dev \
    libssl-dev \
    libyaml-dev \
    node-less \
    npm \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8069

CMD ["python3", "odoo-bin", "-c", "odoo.conf"]