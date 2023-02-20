FROM debian:bullseye-slim
RUN apt-get update && apt-get install -y wget gnupg2 libzip4 apt-transport-https lsb-release ca-certificates && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    apt-get update && apt-get install -y php8.2 php8.2-intl php8.2-gd php8.2-soap php8.2-apcu git curl \
    php8.2-cli php8.2-curl php8.2-pgsql php8.2-ldap php8.2-dom \
    php8.2-sqlite php8.2-mysql php8.2-zip php8.2-xml \
    php8.2-mbstring php8.2-dev make libmagickcore-6.q16-2-extra unzip \
    php8.2-redis php8.2-imagick php8.2-dev php-xdebug \
    libsystemd-dev && \
    apt-get autoremove -y && apt-get autoclean && apt-get clean && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* \
RUN phpenmod xml simplexml mbstring mysql ldap gd dom
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version-2.3.10
# Install node npm
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs
