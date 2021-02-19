import multiprocessing

# see: https://docs.gunicorn.org/en/latest/settings.html#settings
bind = "0.0.0.0:5000"
# workers = multiprocessing.cpu_count() * 2 + 1
workers = 2
worker_class = "gevent" # 默认为阻塞模式，最好选择gevent模式
loglevel = 'info'
# accesslog=
# errorlog=
# capture_output=True
