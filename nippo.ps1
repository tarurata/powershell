$filename="$(Get-Date -Format 'yyMMdd')_nippo.txt"

# ファイルの存在判定。存在する場合exitコード1で終了。
if (Test-Path "C:\Users\Wataru\Desktop\memo\${filename}" ){
    echo "今日の日付の日報ファイルはすでに存在しています。"
    exit 1
} 

# tempfileを一時的に作成して、日報のフォーマットを作成。
echo "# $(Get-Date -Format 'yyMMdd')_nippo" >> .\tempfile
echo "" >> .\tempfile
echo "## " >>　.\tempfile

# 文字コードutf8にしてファイルを作成
cat .\tempfile | Out-File -Encoding utf8 -FilePath ".\${filename}"

# テンポラリファイル削除
rm .\tempfile

# ファイルを開く（デフォルト→サクラで開く。これでBOMなしUTF8にできるので、linuxでも扱いやすい。検索とか。）
Invoke-Item ".\${filename}"