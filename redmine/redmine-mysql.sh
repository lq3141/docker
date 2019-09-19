## reference doc
## + https://www.hiroom2.com/2017/12/14/docker-redmine-en/

## redmine network exist
RM_NET_EXIST=1

## original reference docker command works
if ( false ); then
    docker run  --name some-mysql --network some-network -e MYSQL_USER=redmine -e MYSQL_PASSWORD=secret -e MYSQL_DATABASE=redmine -e MYSQL_RANDOM_ROOT_PASSWORD=1 mysql:5.7
    docker run --name some-redmine --network some-network -e REDMINE_DB_MYSQL=some-mysql -e REDMINE_DB_USERNAME=redmine -e REDMINE_DB_PASSWORD=secret -p 3000:3000 redmine
fi

## code for command try
if ( false ); then
    docker stop redmine
    docker stop mysql-redmine
    docker rm redmine
    docker rm mysql-redmine
    ## clean sql folder for a clean run sql run
    sudo rm -rf /home/jenkins/Docker/mysql-redmine/*

    docker run --name mysql-redmine --network redmine-network -e MYSQL_USER=redmine -e MYSQL_PASSWORD=redmine -e MYSQL_DATABASE=redmine -e MYSQL_ROOT_PASSWORD=redmine -v /home/jenkins/Docker/mysql-redmine:/var/lib/mysql mysql:5.7
    docker run --name redmine --network redmine-network -e REDMINE_DB_MYSQL=mysql-redmine -e REDMINE_DB_USERNAME=redmine -e REDMINE_DB_PASSWORD=redmine -p 3000:3000 redmine
fi

if [[ $RM_NET_EXIST == 0 ]]; then
    ##
    docker network create --driver bridge redmine-network
fi
##
docker run  -d  \
            --name mysql-redmine            \
            --network redmine-network       \
            -e MYSQL_USER=redmine           \
            -e MYSQL_PASSWORD=redmine       \
            -e MYSQL_DATABASE=redmine       \
            -e MYSQL_ROOT_PASSWORD=redmine  \
            -v /home/jenkins/Docker/mysql-redmine:/var/lib/mysql \
            mysql:5.7
##
docker run  -d                          \
            --name redmine              \
            --network redmine-network   \
            -e REDMINE_DB_MYSQL=mysql-redmine   \
            -e REDMINE_DB_USERNAME=redmine      \
            -e REDMINE_DB_PASSWORD=redmine      \
            -v /home/jenkins/Docker/redmine/files:/usr/src/redmine/files                    \
            -v /home/jenkins/Docker/redmine/plugins:/usr/src/redmine/plugins                \
            -v /home/jenkins/Docker/redmine/vendor/plugins:/usr/src/redmine/vendor/plugins  \
            -v /home/jenkins/Docker/redmine/public/themes:/usr/src/redmine/public/themes    \
            -p 3000:3000                \
            redmine

