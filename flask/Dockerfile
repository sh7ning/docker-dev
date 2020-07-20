FROM python:3.7-stretch

# 设置时区
ENV TZ=Asia/Shanghai
# 设置语言
ENV LC_ALL=C.UTF-8

COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip && \
        pip install -r /tmp/requirements.txt && \
        rm /tmp/requirements.txt
# RUN rm -rf ./cache

COPY gunicorn.conf.py /etc/gunicorn.conf.py

VOLUME /app

WORKDIR /app

EXPOSE 5000

CMD ["gunicorn", "app:app", "-c", "/etc/gunicorn.conf.py"]
# CMD ["sleep", "10000000"]
