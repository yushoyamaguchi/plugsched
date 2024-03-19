#!/bin/bash

# パターンにマッチするファイルを検索し、削除する
pattern="dmesg_*.txt"

# パターンにマッチするファイルの削除を実行
rm -f $pattern
echo "マッチしたファイルが削除されました。"
