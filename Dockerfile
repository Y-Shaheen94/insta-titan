FROM python:3.11-slim

# تثبيت متطلبات النظام لـ OpenCV والمكتبات الأخرى
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1 \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# تعيين مجلد العمل
WORKDIR /app

# نسخ وتثبيت متطلبات بايثون
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# نسخ باقي ملفات المشروع
COPY . .

# تعريض المنفذ (Render يقوم بتعيينه تلقائياً عبر متغير البيئة PORT)
EXPOSE 10000

# أمر التشغيل
CMD ["python", "main.py", "run"]
