FROM python:3-alpine

RUN apk update \
  && apk add --virtual build-deps gcc python3-dev musl-dev \
  && apk add postgresql-dev tzdata \
  && cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && pip install psycopg2==2.7.4 \
  && pip install Flask==1.0.2 \
  && pip install flask_sqlalchemy==2.3.2 \
  && pip install SQLAlchemy==1.2.8 \
  && pip install flask_cors==3.0.4 \
  && pip install pyjwt==1.6.4 \
  && pip install flask-script==2.0.6 \
  && pip install flask-migrate==2.1.1 \
  && pip install flask-talisman==0.5.0 \
  && pip install Flask-Security==3.0.0 \
  && pip install rfc3339==6.0 \
  && pip install iso8601==0.1.12 \
  && pip install pytz==2018.4 \
  && pip install flask-apscheduler==1.8.0 \
  && pip install portalocker==1.2.1 \
  && pip install requests==2.19.1 \
  && pip install redis==2.10.6 \
  && pip install addict==2.1.3 \
  && pip install gunicorn==19.8.1 \
  && apk del build-deps