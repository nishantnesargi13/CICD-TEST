FROM python:3.12-slim AS p
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt && apt update
COPY app.py .
RUN chmod +x app.py

FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY --from=p /app /app
EXPOSE 5000
CMD ["python","app.py"]
 
