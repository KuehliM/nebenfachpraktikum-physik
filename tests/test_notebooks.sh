#!/bin/bash
set -e

for nb in notebooks/*.ipynb; do
  echo "Teste $nb"
  jupyter nbconvert --to notebook --execute "$nb" --output /tmp/test.ipynb
done

echo "Alle Notebooks erfolgreich getestet."