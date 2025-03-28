#!/bin/bash
VERSION=$1
docker build -t prueba:$VERSION .
docker tag prueba:$VERSION luisdaries/prueba:$VERSION
docker push luisdaries/prueba:$VERSION
cd ../miapp-manifests
sed -i "s/image: luisdaries\/prueba:.*/image: luisdaries\/prueba:$VERSION/" deployment.yaml
git add deployment.yaml
git commit -m "Actualizar a versión $VERSION"
git push