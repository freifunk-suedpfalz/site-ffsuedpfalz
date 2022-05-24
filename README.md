Gluon site config für Freifunk Südpfalz in der Queichufer Domain des Freifunk Rheinland e.V.

Builds can be done via jenkins or docker.

##Docker
Clone Repository and create the image.

```
git clone https://github.com/freifunk-suedpfalz/site-ffsuedpfalz
cd site-suedpfalz
```

change to the version you want to build for example 1.4.14_b

```
git checkout 1.4.14_b
```

Start building

```
docker-compose up
```

### Cleaning up

Remove site-suedpfalz docker container

```
docker-compose rm
```

Remove site-suedpfalz_output folder with builded firmware

```

docker volume rm site-suedpfalz_output
```

## create a new firmware version

make new branch for the firmware
do all the necessary changes for the new version
edit [docker-compose.env](/docker-compose.env)
