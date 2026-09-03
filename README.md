# Nebenfachpraktikum Physik – Jupyter-Profil

Dieses Repository enthält Auswertungsnotebooks zu den Versuchen des physikalischen Nebenfachpraktikums und wird als **RWTHjupyter-Profil** bereitgestellt: Studierende gelangen über einen Permalink direkt in ein vorkonfiguriertes JupyterLab, in das dieses Repository automatisch eingebunden wird ([nbgitpuller](https://github.com/jupyterhub/nbgitpuller)).

## Struktur

```
.
├── Dockerfile          # Laufzeitumgebung (Basis-Image + zusätzliche Pakete)
├── requirements.txt    # Python-Abhängigkeiten (pip)
└── notebooks/
    ├── index.ipynb          # Startseite, wird beim Login zuerst geöffnet
    ├── 00_umgebungstest.ipynb
    └── NN_versuchsname.ipynb # ein Notebook pro Versuch, siehe notebooks/README.md
```

## Enthaltene Pakete

- numpy
- scipy
- pandas
- matplotlib
- openpyxl
- uncertainties
- sympy
- ipympl

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

## RWTHjupyter-Profil

Dieses Repo ist als Notebook- *und* Image-Repository für das gleichnamige RWTHjupyter-Profil vorgesehen (siehe `image.repo` / `notebooks.repo` im Profilantrag). Details zum Profilantrag-Prozess: [RWTH ITC Hilfeartikel „Neues Profil anlegen“](https://help.itc.rwth-aachen.de/service/8755ff0a2e134bc1a78f4993672487f8/article/7f10b307b62b4bdaa039e8410b8545da/).

## Lizenz

MIT, siehe [LICENSE](LICENSE).
