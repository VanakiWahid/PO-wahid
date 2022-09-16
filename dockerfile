FROM ubuntu

WORKDIR /app
ADD Social-Reporter /app/Social-Reporter

RUN apt-get update \
  && apt-get -y install tesseract-ocr \
  && apt-get install -y python3 python3-distutils python3-pip \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 --no-cache-dir install --upgrade pip \
  && rm -rf /var/lib/apt/lists/*

RUN apt update && apt-get install ffmpeg libsm6 libxext6 -y
RUN pip3 install opencv-python
RUN pip3 install pillow
RUN pip3 install cvlib==0.2.6
RUN pip3 install setuptools==57.0.0
RUN pip3 install tensorflow==2.10.0
RUN pip3 install facial-emotion-recognition==0.3.4
RUN pip3 install pytesseract
RUN pip3 install torchvision
RUN pip3 install pandas

RUN rm /usr/local/lib/python3.10/dist-packages/cvlib/object_detection.py
RUN rm /usr/local/lib/python3.10/dist-packages/facial_emotion_recognition/facial_emotion_recognition.py
RUN cp -a /app/Social-Reporter/adapted_python_libs/object_detection.py /usr/local/lib/python3.10/dist-packages/cvlib/
RUN cp -a /app/Social-Reporter/adapted_python_libs/facial_emotion_recognition.py /usr/local/lib/python3.10/dist-packages/facial_emotion_recognition/
