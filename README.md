# oumua

讓 AJXD 專心背單字

# 題目type
T1：題目、四個選項、答案 
T2：題目、答案 ----打字輸入 
T3：題目是一張圖片圖片、四個選項、答案 
T4：題目（念）、四個選項、答案 
T5：題目（念）、題目 2 （顯示要問的問題）、答案 ----打字輸入 
T6：題目（念）、四個選項（圖片）、答案（圖片檔名） 
T7：題目（念）、題目 2 （顯示句子）、四個選項、答案

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