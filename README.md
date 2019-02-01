# How tu run Symfony 4 application in Azure Websites (IIS)

You simply need override IIS configuration to fit Symfony4 rewrite rules and directories

- First you need to create file `web.config` in root directory of your project and copy there content of [web.config](https://github.com/eyeskiller/symfony4-iss-azure-websites/blob/master/web.config)
- Second, you need to create file `web.config` in `public` directory and copy there content of [web.config](https://github.com/eyeskiller/symfony4-iss-azure-websites/blob/master/public/web.config)


Now, all set.

Don't forget to create a deploy file and paste it to your root, which can be set for example: 

`.deployment`
```
[config]
command = bash build_azure.sh
```

`build_azure.sh`
```bash
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

```

You can customize `buil_azure.sh` as you need, but this is minimal configuration.
Don't forget to add `composer.phar` to your project root.