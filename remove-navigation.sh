#!/bin/bash

# Hugo Book 移除頂部導航列腳本
# 使用方法: 在你的 Hugo 網站根目錄執行這個腳本

echo "🗑️  開始移除頂部導航列..."
echo ""

# 檢查資料夾是否存在
if [ ! -d "layouts/partials/docs/inject" ]; then
    echo "ℹ️  layouts/partials/docs/inject 資料夾不存在"
    echo "✅ 你的網站已經是原始狀態了!"
    exit 0
fi

# 詢問用戶確認
echo "⚠️  這個操作會:"
echo "   1. 刪除 layouts/partials/docs/inject/head.html"
echo "   2. 刪除 layouts/partials/docs/inject/menu-before.html"
echo "   3. 刪除 layouts/partials/docs/inject/ 資料夾"
echo ""
echo "你的網站會回到最原始的 Hugo Book 主題樣式(沒有頂部導航列)"
echo ""
read -p "確定要繼續嗎? (y/n): " confirm

if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
    echo "❌ 已取消操作"
    exit 0
fi

echo ""
echo "🗑️  正在移除檔案..."

# 刪除 inject 資料夾中的檔案
rm -f layouts/partials/docs/inject/head.html
rm -f layouts/partials/docs/inject/menu-before.html
rm -f layouts/partials/docs/inject/head.html.backup
rm -f layouts/partials/docs/inject/menu-before.html.backup

# 刪除 inject 資料夾(如果是空的)
rmdir layouts/partials/docs/inject 2>/dev/null

echo ""
echo "✅ 移除完成!"
echo ""
echo "🎉 你的網站已恢復為原始的 Hugo Book 主題!"
echo ""
echo "📋 下一步:"
echo "1. 如果 hugo server 正在執行,請按 Ctrl+C 停止"
echo "2. 重新執行 'hugo server'"
echo "3. 打開瀏覽器訪問 http://localhost:1313"
echo ""
echo "💡 提示:"
echo "- 現在你會看到原始的 Hugo Book 側邊欄導航"
echo "- 沒有頂部導航列了"
echo "- 如果之後想要重新安裝,執行 install.sh 即可"
echo ""
