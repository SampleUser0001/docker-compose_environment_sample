FROM ubuntu

ARG V01a
ARG V02a
ARG V03a
ENV V04a=$V04a
ENV V05a=$V05a
ENV V06a=$V06a
ARG V11a
ARG V12a
ARG V13a
ENV V14a=$V14a
ENV V15a=$V15a
ENV V16a=$V16a

ARG V01b $V01a
ENV V02b=$V02a

ARG V04b $V04a
ENV V05b=$V05a

ARG V11b $V11a
ENV V12b=$V12a

ARG V14b $V14a
ENV V15b=$V15a

ARG V21='v21'
ENV V31='v31'

ARG V61a
ENV V61a $V61a

WORKDIR /app

COPY start.sh /app/start.sh

RUN chmod 755 /app/start.sh

CMD [ "sh" , "/app/start.sh" ]
