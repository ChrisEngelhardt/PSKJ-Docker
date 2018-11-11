FROM python


#RUN apt-get update && apt-get install


COPY ./requirements.txt /requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

WORKDIR /app/src/
CMD [ "python", "./main.py" ]