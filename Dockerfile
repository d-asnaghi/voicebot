FROM python:3.7
WORKDIR /app
RUN apt-get update && apt-get install -y ffmpeg

ENV VIRTUAL_ENV=/chatbot-venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install dependencies:
COPY requirements.txt .
RUN pip install -r requirements.txt

# Expose the port
EXPOSE 8080

# Copy the source directory.
COPY .env .
COPY source source

# RUn the application
CMD ["python", "source/bot.py"]