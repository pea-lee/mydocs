#!/bin/bash

# 自動為所有 markdown 文章添加日期
# 使用檔案的修改時間作為日期
# 使用方法: 在 Hugo 網站根目錄執行

echo "📅 開始為文章添加日期..."
echo ""

# 檢查 content 資料夾是否存在
if [ ! -d "content" ]; then
    echo "❌ 找不到 content 資料夾"
    exit 1
fi

# 計數器
total=0
updated=0
skipped=0

# 遞迴尋找所有 .md 檔案
while IFS= read -r -d '' file; do
    ((total++))
    
    # 取得檔案名稱(用於顯示)
    filename=$(basename "$file")
    
    # 檢查檔案是否已經有 date 欄位
    if grep -q "^date:" "$file" 2>/dev/null; then
        echo "⏭️  跳過 $file (已有日期)"
        ((skipped++))
        continue
    fi
    
    # 取得檔案的修改時間,轉換成 YYYY-MM-DD 格式
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        filedate=$(stat -f "%Sm" -t "%Y-%m-%d" "$file")
    else
        # Linux
        filedate=$(date -r "$file" +%Y-%m-%d)
    fi
    
    # 檢查檔案是否有 front matter (---)
    if head -n 1 "$file" | grep -q "^---"; then
        # 有 front matter,在第一個 --- 之後插入 date
        # 建立暫存檔
        tmpfile="${file}.tmp"
        
        # 讀取檔案,在 front matter 中插入 date
        awk -v date="$filedate" '
        BEGIN { found_first = 0; inserted = 0 }
        /^---/ {
            print
            if (found_first == 0) {
                found_first = 1
            } else if (inserted == 0) {
                # 第二個 --- 之前插入 date
                print "date: " date
                inserted = 1
            }
            next
        }
        found_first == 1 && inserted == 0 && /^title:/ {
            print
            print "date: " date
            inserted = 1
            next
        }
        { print }
        ' "$file" > "$tmpfile"
        
        # 替換原檔案
        mv "$tmpfile" "$file"
        echo "✅ 已更新 $file (日期: $filedate)"
        ((updated++))
    else
        # 沒有 front matter,在檔案開頭加上
        tmpfile="${file}.tmp"
        
        # 取得檔案名稱作為標題(去掉 .md)
        title=$(basename "$file" .md)
        
        # 建立新的 front matter
        {
            echo "---"
            echo "title: \"$title\""
            echo "date: $filedate"
            echo "---"
            echo ""
            cat "$file"
        } > "$tmpfile"
        
        mv "$tmpfile" "$file"
        echo "✅ 已更新 $file (日期: $filedate, 新增 front matter)"
        ((updated++))
    fi
    
done < <(find content -name "*.md" -type f -print0)

echo ""
echo "=========================================="
echo "📊 處理完成!"
echo "   總共檔案: $total"
echo "   已更新: $updated"
echo "   已跳過: $skipped"
echo "=========================================="
echo ""
echo "📋 下一步:"
echo "   1. 檢查檔案是否正確"
echo "   2. 重啟 hugo server"
echo "   3. 訪問「所有文章」頁面查看"
echo ""
echo "💡 提示:"
echo "   - 日期是用檔案的修改時間"
echo "   - 如果想改日期,可以手動編輯 .md 檔案"
echo "   - 格式: date: 2026-02-03"
echo ""
