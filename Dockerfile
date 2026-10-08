# Basis-Image des RWTHjupyter-Clusters.
# Siehe https://git.rwth-aachen.de/jupyter/profiles bzw. das Beispielprofil
# https://git.rwth-aachen.de/jupyter/example-profile für weitere Varianten
# (z.B. andere Python-Versionen: rwth-courses-python-3.9 ... 3.13).
#
# Für rein lokale Tests OHNE Zugriff auf die RWTH-GitLab-Registry (kein
# `docker login registry.git.rwth-aachen.de` mit RWTH-Account) kann auf ein
# öffentlich verfügbares Ersatz-Image ausgewichen werden:
#
#   docker build --build-arg BASE_IMAGE=quay.io/jupyter/scipy-notebook:python-3.12 \
#                --build-arg CONDA_ENV=base -t nebenfachpraktikum:test .
#
ARG BASE_IMAGE=registry.git.rwth-aachen.de/jupyter/profiles/rwth-courses-python-3.12:latest
FROM ${BASE_IMAGE}

# Zusätzliche Python-Pakete für das Nebenfachpraktikum.
# Der Kernel "Python 3.12 (ipykernel)" des RWTH-Basisimages läuft im Conda-Env
# `python312`, nicht im Base-Env. Ein einfaches `pip install` landet im falschen
# Env: Das Image baut zwar fehlerfrei, aber im Notebook fehlen die Pakete
# (vgl. Dockerfile.python-3.12 im example-profile).
ARG CONDA_ENV=python312
COPY requirements.txt /tmp/requirements.txt
RUN conda run -n "${CONDA_ENV}" python -m pip install --no-cache-dir -r /tmp/requirements.txt
