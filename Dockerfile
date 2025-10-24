# Use lightweight Python image
FROM python:3.10-slim

# set workdir
WORKDIR /app

# copy requirements first for caching
COPY app/requirements.txt .

# install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# copy app code
COPY app/ /app

# expose port
EXPOSE 8080

# default command
CMD ["python", "app.py"]
