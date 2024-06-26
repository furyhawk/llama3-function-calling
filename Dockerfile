FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

#Copy the requirements.txt file to the container
COPY requirements.txt .

#Install necessary packages from requirements.txt with no cache dir allowing for installation on machine with very little memory on board
RUN pip install --upgrade pip
RUN pip --no-cache-dir install -r requirements.txt

COPY . .

#Exposing the default streamlit port
EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

#Running the streamlit app
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
