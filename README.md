# oumua

讓 AJXD 專心背單字


## Github Page
```shell
flutter build web --release --base-href /oumua/ --pwa-strategy=none
rm -rf docs
mkdir docs
cp -r build/web/* docs/
git add docs
git commit -m "Update Pages"
git push
```