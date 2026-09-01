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
#                -t nebenfachpraktikum:test .
#
ARG BASE_IMAGE=registry.git.rwth-aachen.de/jupyter/profiles/rwth-courses-python-3.12:latest
FROM ${BASE_IMAGE}

# Zusätzliche Python-Pakete für das Nebenfachpraktikum
COPY requirements.txt /tmp/requirements.txt
RUN python -m pip install --no-cache-dir -r /tmp/requirements.txt
