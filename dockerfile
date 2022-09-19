FROM ubuntu

WORKDIR /app
ADD Social-Reporter /app/Social-Reporter

RUN apt-get update
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install python3.7 python3.7-distutils python3-pip -y
RUN apt-get install python3-pip -y

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1
RUN update-alternatives --config python3
RUN apt-get -y install tesseract-ocr

RUN pip install opencv-python==4.5.2.54
RUN pip install cvlib==0.2.6
RUN pip install setuptools==57.0.0
RUN pip install tensorflow==2.1.0
RUN pip install facial-emotion-recognition==0.3.4
RUN pip install pytesseract==0.3.8
RUN pip install torchvision==0.9.1
RUN pip install pandas==1.3.1
RUN pip install protobuf==3.20.*


RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN apt-get install libtesseract-dev -y

RUN rm /usr/local/lib/python3.7/dist-packages/cvlib/object_detection.py
RUN rm /usr/local/lib/python3.7/dist-packages/facial_emotion_recognition/facial_emotion_recognition.py
RUN cp -a /app/Social-Reporter/adapted_python_libs/object_detection.py /usr/local/lib/python3.7/dist-packages/cvlib/
RUN cp -a /app/Social-Reporter/adapted_python_libs/facial_emotion_recognition.py /usr/local/lib/python3.7/dist-packages/facial_emotion_recognition/
