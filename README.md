# Nebenfachpraktikum Physik – Jupyter-Profil

Auswertungsnotebooks zu den Versuchen des physikalischen Nebenfachpraktikums.

## Lokaler Test

**Mit dem echten RWTHjupyter-Basisimage** (erfordert `docker login registry.git.rwth-aachen.de` mit RWTH-GitLab-Account):

```bash
docker build -t nebenfachpraktikum:test .
docker run -it --rm -p 8888:8888 nebenfachpraktikum:test
```

**Rein lokal, ohne RWTH-Zugang** (weicht auf ein öffentliches Ersatz-Image aus):

```bash
docker build --build-arg BASE_IMAGE=quay.io/jupyter/scipy-notebook:python-3.12 \
              -t nebenfachpraktikum:test .
docker run -it --rm -p 8888:8888 nebenfachpraktikum:test
```

## Lizenz

MIT, siehe [LICENSE](LICENSE).
