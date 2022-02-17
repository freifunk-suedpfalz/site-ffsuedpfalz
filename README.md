Gluon site config für Freifunk Südpfalz in der Queichufer Domain des Freifunk Rheinland e.V.

Builds can be done via jenkins or docker.

Docker:
Clone Repository and create the image.

```
git clone https://github.com/freifunk-suedpfalz/site-ffsuedpfalz
cd site-suedpfalz
git checkout 1.4.14_b
docker build -t fw .
docker run --env CORES=9 --env VERBOSE=w -v <lokaler path>:/output fw
```
