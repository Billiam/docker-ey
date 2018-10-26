FROM ruby:2.3

RUN gem install engineyard -v 3.2.5

ARG USER_NAME
ARG USER_UID
ARG USER_GID

RUN groupadd --gid $USER_GID $USER_NAME
RUN useradd --uid $USER_UID --gid $USER_GID -m $USER_NAME
USER $USER_NAME

RUN mkdir "/home/$USER_NAME/.ey"
WORKDIR "/home/$USER_NAME"

ENV EYRC "~/.ey/.eyrc"
ENV SSH_AUTH_SOCK "/ssh-agent"

VOLUME ["/home/$USER_NAME/.ey"]
ENTRYPOINT ["ey"]
