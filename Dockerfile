FROM ubuntu
RUN apt-get update && apt-get install -y \
        emacs-nox \
        apt-transport-https \
        gnupg2 \
        curl \
        && rm -rf /var/lib/apt/lists/*
RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list \
    && curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_unstable.list > /etc/apt/sources.list.d/dart_unstable.list
RUN apt-get update && apt-get install -y \
        dart
RUN apt-get install -y \
        git
RUN mkdir -p /root/.emacs.d/lisp \
        && cd /root/.emacs.d/lisp \
        && git clone https://github.com/magnars/s.el.git \
        && git clone https://github.com/magnars/dash.el.git \
        && git clone https://github.com/bradyt/dart-mode.git
RUN curl https://raw.githubusercontent.com/flutter/flutter/master/examples/platform_channel/lib/main.dart > main.dart
ADD .emacs.d/init.el /root/.emacs.d/init.el
