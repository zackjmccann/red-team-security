
# syntax=docker/dockerfile:1
FROM python:3.10-alpine

RUN apk update && apk add git make gcc musl-dev linux-headers

ADD --chmod=755 https://astral.sh/uv/install.sh /install.sh
RUN /install.sh && rm /install.sh
COPY requirements.txt /requirements.txt
RUN /root/.cargo/bin/uv pip install --system --no-cache -r requirements.txt

ADD --chmod=755 https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb msfinstall
RUN chmod 755 ./msfinstall

EXPOSE 5000

COPY . .
WORKDIR /src

CMD ["flask", "run", "--debug"]
