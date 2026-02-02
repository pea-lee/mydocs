#!/bin/bash

# True Grit 風格一鍵安裝腳本
# 使用方法: bash setup-truegrit-style.sh

echo "🎨 開始安裝 True Grit 風格..."
echo ""

# 確認在正確的目錄
if [ ! -f "hugo.toml" ]; then
    echo "❌ 錯誤：找不到 hugo.toml 檔案"
    echo "請確保你在專案根目錄執行此腳本"
    exit 1
fi

# 建立 assets 資料夾
echo "📁 建立 assets 資料夾..."
mkdir -p assets

# 建立 _custom.scss 檔案
echo "✏️  建立自訂 CSS 檔案..."
cat > assets/_custom.scss << 'EOF'
// True Grit 風格自訂樣式

// === 深色主題配色 ===
body {
  background: #1a1a1a !important;
  color: #e8e4da !important;
  font-family: 'Courier New', 'Courier', monospace;
}

// === 側邊選單 ===
.book-menu {
  background: #0f0f0f !important;
  border-right: 2px solid #2a2a2a !important;
  
  nav {
    background: #0f0f0f !important;
  }
  
  a {
    color: #c4b9a0 !important;
    
    &:hover {
      color: #d4a574 !important;
      background: rgba(212, 165, 116, 0.1) !important;
    }
  }
  
  .active {
    color: #d4a574 !important;
    background: rgba(212, 165, 116, 0.15) !important;
  }
}

// === 主內容區域 ===
.book-page {
  background: rgba(26, 26, 26, 0.95) !important;
}

// === 標題樣式 ===
h1, h2, h3, h4, h5, h6 {
  color: #f5f1e8 !important;
  font-weight: bold !important;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8);
}

// === 連結樣式 ===
a {
  color: #d4a574 !important;
  
  &:hover {
    color: #e8b57f !important;
  }
  
  &:visited {
    color: #c99b6a !important;
  }
}

// === 程式碼區塊 ===
code {
  background: #2a2a2a !important;
  color: #f5f1e8 !important;
  border: 1px solid #3a3a3a !important;
  padding: 0.2em 0.4em;
  border-radius: 3px;
}

pre {
  background: #0f0f0f !important;
  border: 2px solid #2a2a2a !important;
  padding: 1rem;
  
  code {
    background: transparent !important;
    border: none !important;
  }
}

// === 引用塊 ===
blockquote {
  border-left: 4px solid #d4a574 !important;
  background: rgba(212, 165, 116, 0.05) !important;
  padding: 1rem;
  color: #c4b9a0 !important;
  font-style: italic;
}

// === 表格樣式 ===
table {
  border: 2px solid #2a2a2a !important;
  background: #0f0f0f !important;
  
  th {
    background: #1a1a1a !important;
    color: #d4a574 !important;
    font-weight: bold;
    text-transform: uppercase;
  }
  
  td {
    border: 1px solid #2a2a2a !important;
    color: #e8e4da !important;
  }
  
  tr:hover {
    background: rgba(212, 165, 116, 0.05) !important;
  }
}

// === 圖片樣式 ===
img {
  border: 3px solid #2a2a2a;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
  filter: contrast(1.1) brightness(0.95);
  
  &:hover {
    filter: contrast(1.2) brightness(1);
    transform: scale(1.02);
    transition: all 0.3s;
  }
}

// === 搜尋框 ===
.book-search input {
  background: #2a2a2a !important;
  color: #e8e4da !important;
  border: 1px solid #3a3a3a !important;
  
  &:focus {
    border-color: #d4a574 !important;
  }
}

// === 捲軸樣式 ===
::-webkit-scrollbar {
  width: 12px;
  height: 12px;
}

::-webkit-scrollbar-track {
  background: #0f0f0f;
}

::-webkit-scrollbar-thumb {
  background: #3a3a3a;
  border-radius: 6px;
  
  &:hover {
    background: #4a4a4a;
  }
}

// === 目錄 (TOC) ===
.book-toc {
  nav > ul {
    background: #0f0f0f;
    border: 1px solid #2a2a2a;
    padding: 1rem;
  }
  
  a {
    color: #c4b9a0 !important;
    
    &:hover {
      color: #d4a574 !important;
    }
  }
}

// === 頁面導航 ===
.book-footer {
  background: rgba(15, 15, 15, 0.5) !important;
  border-top: 2px solid #2a2a2a !important;
  
  a {
    color: #d4a574 !important;
  }
}

// === 添加紋理效果 ===
.book-page::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-image: 
    repeating-linear-gradient(
      0deg,
      transparent,
      transparent 2px,
      rgba(255, 255, 255, 0.03) 2px,
      rgba(255, 255, 255, 0.03) 4px
    );
  pointer-events: none;
  opacity: 0.3;
  z-index: -1;
}
EOF

echo "✅ CSS 檔案建立完成！"
echo ""

# 建立 layouts 目錄結構（可選，用於字體）
read -p "要安裝手繪風格字體嗎？(y/n): " install_fonts

if [ "$install_fonts" = "y" ] || [ "$install_fonts" = "Y" ]; then
    echo "📝 建立字體設定..."
    mkdir -p layouts/partials/docs/inject
    
    cat > layouts/partials/docs/inject/head.html << 'EOF'
<!-- 載入 Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&family=Courier+Prime&family=Special+Elite&display=swap" rel="stylesheet">

<style>
  /* 使用手繪風格字體 */
  body {
    font-family: 'Courier Prime', 'Courier New', monospace !important;
  }
  
  h1, h2, h3, h4, h5, h6 {
    font-family: 'Permanent Marker', cursive !important;
  }
</style>
EOF
    
    echo "✅ 字體設定完成！"
fi

echo ""
echo "🎉 True Grit 風格安裝完成！"
echo ""
echo "📋 接下來的步驟："
echo "1. 執行: git add assets/ layouts/"
echo "2. 執行: git commit -m 'Add True Grit styling'"
echo "3. 執行: git push"
echo "4. 等待 GitHub Actions 完成（約 1-3 分鐘）"
echo "5. 重新整理網站查看效果！"
echo ""

# 詢問是否要自動提交
read -p "要現在就提交並推送到 GitHub 嗎？(y/n): " auto_commit

if [ "$auto_commit" = "y" ] || [ "$auto_commit" = "Y" ]; then
    echo ""
    echo "🚀 開始提交..."
    
    git add assets/
    if [ "$install_fonts" = "y" ] || [ "$install_fonts" = "Y" ]; then
        git add layouts/
    fi
    
    git commit -m "Add True Grit inspired custom styling"
    
    echo "📤 推送到 GitHub..."
    git push
    
    echo ""
    echo "✅ 完成！請等待 1-3 分鐘後重新整理網站。"
    echo "🌐 網站: https://pealee.com"
else
    echo ""
    echo "👍 好的，請記得手動執行上述步驟！"
fi