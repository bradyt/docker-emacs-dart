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
ADD .emacs.d/install-dart-mode.el /root/.emacs.d/install-dart-mode.el
RUN emacs -batch -l /root/.emacs.d/install-dart-mode.el
RUN curl https://raw.githubusercontent.com/flutter/flutter/master/examples/platform_channel/lib/main.dart > main.dart
ADD .emacs.d/init.el /root/.emacs.d/init.el
CMD emacs main.dart
