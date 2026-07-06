FROM python:3.11-slim

WORKDIR /app

# نصب وابستگی‌های سیستمی
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# نصب هرمس
RUN curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash

# کپی فایل requirements.txt و نصب وابستگی‌های پایتون
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# کپی بقیه فایل‌ها
COPY . .

# اجرای گیت‌وی هرمس
CMD ["hermes", "gateway", "start"]
