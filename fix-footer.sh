#!/bin/bash

# 把 footer bar 改成透明
# 使用方法: 在 Hugo 網站根目錄執行

echo "🎨 更新 footer 為透明..."

# 確認 _custom.scss 存在
if [ ! -f "assets/_custom.scss" ]; then
    echo "❌ 找不到 assets/_custom.scss"
    echo "   請先執行 update-blog-style.sh"
    exit 1
fi

# 在 _custom.scss 的最後面添加 footer 透明樣式
cat >> assets/_custom.scss << 'EOF'

// ================================================
// Footer 透明化
// ================================================
.book-footer {
  background-color: transparent !important;
  border-top: none !important;
}
EOF

echo ""
echo "✅ 完成!"
echo ""
echo "📋 下一步:"
echo "   1. 按 Ctrl+C 停止 hugo server"
echo "   2. 重新執行: hugo server"
echo "   3. 打開: http://localhost:1313"
echo ""
