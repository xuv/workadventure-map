set -ex

rm -rf deploy
mkdir deploy

npm run build
cp dist/script.js deploy/

cp map.json deploy/
cp -r src deploy/

tree deploy/

gsutil -m rsync -d -r deploy 'gs://thoughtadventure-maps/' 