#!/bin/bash
set -e #abort when first programm errors

#Switch to working directory
cd 'D:\home\site\wwwroot\'

#install composer dependencies
php "D:\home\site\wwwroot\composer.phar" install


#clear Symfony cache
bin/console cache:clear

#install public assets
bin/console assets:install public