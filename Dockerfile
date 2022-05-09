### Base
FROM python:3.10-buster

#### Autor
LABEL authors='Lucas Roxo'

#### Copiando código
COPY . /app/

#### Trocando o diretório para instalação das dependências
WORKDIR /app/

#### Instalando nodejs 14.19.0
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs

#### Instalando dependências para execução do playwright
RUN apt-get update && apt-get install -y xvfb --no-install-recommends fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libcairo2 libcups2 libdbus-1-3 libdrm2 libegl1 libgbm1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxdamage1 libxext6 libxfixes3 libxrandr2 libxshmfence1 xvfb fonts-noto-color-emoji ttf-unifont libfontconfig libfreetype6 xfonts-cyrillic xfonts-scalable fonts-ipafont-gothic fonts-wqy-zenhei fonts-tlwg-loma-otf ffmpeg libcairo-gobject2 libdbus-glib-1-2 libfontconfig1 libgdk-pixbuf2.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libxcb-shm0 libxcursor1 libxi6 libxrender1 libxt6 libxtst6 gstreamer1.0-libav gstreamer1.0-plugins-bad gstreamer1.0-plugins-base gstreamer1.0-plugins-good libenchant1c2a libepoxy0 libevdev2 libgl1 libgles2 libgstreamer-gl1.0-0 libgstreamer1.0-0 libharfbuzz-icu0 libharfbuzz0b libhyphen0   libnotify4 libopenjp2-7 libopus0 libpng16-16 libsecret-1-0 libsoup2.4-1  libwayland-client0 libwayland-egl1 libwayland-server0 libwebp6 libwebpdemux2 libwoff1 libxkbcommon0 libxml2 libxslt1.1

#### Atualizando o pip 
RUN pip install -U pip

#### Instalando dependências python
RUN pip install build

#### Instalando dependências robot framework
RUN pip install -r /app/requirements.txt

#### Iniciando browser library
RUN rfbrowser init