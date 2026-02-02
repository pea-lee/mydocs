#!/bin/bash

# Hugo Book 導航列美化腳本 - 更新為 Wiwi.Blog 風格
# 使用方法: 在你的 Hugo 網站根目錄執行這個腳本

echo "🎨 開始更新為 Wiwi.Blog 風格..."
echo ""

# 檢查資料夾是否存在
if [ ! -d "layouts/partials/docs/inject" ]; then
    echo "❌ 錯誤: 找不到 layouts/partials/docs/inject 資料夾"
    echo "💡 請確認:"
    echo "   1. 你在 Hugo 網站的根目錄中"
    echo "   2. 已經執行過 install.sh 安裝原始導航列"
    exit 1
fi

# 備份原始檔案
echo "📦 備份原始檔案..."
cp layouts/partials/docs/inject/head.html layouts/partials/docs/inject/head.html.backup 2>/dev/null
cp layouts/partials/docs/inject/menu-before.html layouts/partials/docs/inject/menu-before.html.backup 2>/dev/null
echo "✅ 已備份為 .backup 檔案"
echo ""

# 更新 head.html (CSS 樣式)
echo "🎨 更新 CSS 樣式..."
cat > layouts/partials/docs/inject/head.html << 'EOF'
<!-- layouts/partials/docs/inject/head.html -->

<style>
/* === Wiwi.Blog 風格的頂部導航列 === */

.top-navigation {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 64px;
  background: #ffffff;
  border-bottom: 1px solid #e8e8e8;
  z-index: 1000;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 2.5rem;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
}

/* Logo 區域 */
.top-nav-logo-section {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.top-nav-logo-img {
  width: 32px;
  height: 32px;
  border-radius: 6px;
}

.top-nav-logo {
  font-size: 1.15rem;
  font-weight: 700;
  color: #000000;
  text-decoration: none;
  letter-spacing: -0.01em;
}

.top-nav-logo:hover {
  color: #2563eb;
  text-decoration: none;
}

/* 導航選單 */
.top-nav-menu {
  display: flex;
  gap: 0.25rem;
  align-items: center;
}

.top-nav-menu a {
  color: #525252;
  text-decoration: none;
  font-weight: 500;
  font-size: 0.9375rem;
  padding: 0.5rem 0.875rem;
  border-radius: 6px;
  transition: all 0.15s ease;
  white-space: nowrap;
}

.top-nav-menu a:hover {
  color: #000000;
  background-color: #f5f5f5;
  text-decoration: none;
}

.top-nav-menu a.active {
  color: #2563eb;
  background-color: #eff6ff;
}

/* 調整主內容區域,避免被導航列遮住 */
.book-page,
.book-menu,
.book-toc {
  padding-top: 64px;
}

/* 平板樣式 */
@media (max-width: 1024px) {
  .top-navigation {
    padding: 0 1.5rem;
  }
  
  .top-nav-menu {
    gap: 0.125rem;
  }
  
  .top-nav-menu a {
    font-size: 0.875rem;
    padding: 0.5rem 0.75rem;
  }
}

/* 手機版樣式 */
@media (max-width: 768px) {
  .top-navigation {
    padding: 0 1rem;
    height: 56px;
  }
  
  .top-nav-logo {
    font-size: 1rem;
  }
  
  .top-nav-logo-img {
    width: 28px;
    height: 28px;
  }
  
  .top-nav-menu {
    gap: 0;
    flex-wrap: wrap;
    justify-content: flex-end;
  }
  
  .top-nav-menu a {
    font-size: 0.8125rem;
    padding: 0.375rem 0.5rem;
  }
  
  .book-page,
  .book-menu,
  .book-toc {
    padding-top: 56px;
  }
}

/* 極小螢幕 */
@media (max-width: 480px) {
  .top-navigation {
    padding: 0 0.75rem;
  }
  
  .top-nav-menu a {
    font-size: 0.75rem;
    padding: 0.375rem 0.4rem;
  }
}

/* 深色模式 */
@media (prefers-color-scheme: dark) {
  .top-navigation {
    background: #18181b;
    border-bottom-color: #27272a;
  }
  
  .top-nav-logo {
    color: #fafafa;
  }
  
  .top-nav-logo:hover {
    color: #60a5fa;
  }
  
  .top-nav-menu a {
    color: #a1a1aa;
  }
  
  .top-nav-menu a:hover {
    color: #fafafa;
    background-color: #27272a;
  }
  
  .top-nav-menu a.active {
    color: #60a5fa;
    background-color: #1e3a5f;
  }
}
</style>
EOF

# 更新 menu-before.html (導航列 HTML)
echo "📝 更新導航列 HTML..."
cat > layouts/partials/docs/inject/menu-before.html << 'EOF'
<!-- layouts/partials/docs/inject/menu-before.html -->

<nav class="top-navigation">
  <!-- Logo 區域 -->
  <a href="/" class="top-nav-logo-section" style="display: flex; align-items: center; gap: 0.5rem; text-decoration: none;">
    <!-- 如果你有 Logo 圖片,取消下面這行的註解,並修改圖片路徑 -->
    <!-- <img src="/img/logo.svg" alt="Logo" class="top-nav-logo-img"> -->
    <span class="top-nav-logo">PeaLee.com</span>
  </a>
  
  <!-- 導航選單 -->
  <div class="top-nav-menu">
    <a href="/blog/">貼文</a>
    <a href="/docs/">筆記</a>
    <a href="/about/">關於</a>
    <a href="/now/">近況</a>
    <a href="/resources/">資源</a>
    <a href="/contact/">聯絡</a>
  </div>
</nav>
EOF

echo ""
echo "✅ 更新完成!"
echo ""
echo "🎉 你的導航列已經更新為 Wiwi.Blog 風格!"
echo ""
echo "📋 下一步:"
echo "1. 如果 hugo server 正在執行,請按 Ctrl+C 停止"
echo "2. 重新執行 'hugo server'"
echo "3. 打開瀏覽器訪問 http://localhost:1313"
echo ""
echo "✏️  客製化:"
echo "- 修改網站名稱: 編輯 layouts/partials/docs/inject/menu-before.html"
echo "- 修改選單項目: 同上"
echo "- 添加 Logo 圖片: 請參考 UPDATE_TO_WIWI_STYLE.md"
echo ""
echo "💾 備份說明:"
echo "- 原始檔案已備份為 .backup"
echo "- 如果想還原,執行: cp layouts/partials/docs/inject/head.html.backup layouts/partials/docs/inject/head.html"
echo ""
echo "🎨 享受你的新導航列吧!"
