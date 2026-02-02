#!/bin/bash

# Hugo Book 頂部導航列安裝腳本
# 使用方法: 在你的 Hugo 網站根目錄執行這個腳本

echo "🚀 開始安裝頂部導航列..."

# 創建必要的資料夾
echo "📁 創建資料夾結構..."
mkdir -p layouts/partials/docs/inject

# 創建 head.html (CSS 樣式)
echo "🎨 創建 CSS 樣式檔案..."
cat > layouts/partials/docs/inject/head.html << 'EOF'
<!-- layouts/partials/docs/inject/head.html -->

<style>
/* 頂部導航列樣式 */
.top-navigation {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 60px;
  background: #ffffff;
  border-bottom: 1px solid #e5e7eb;
  z-index: 1000;
  display: flex;
  align-items: center;
  padding: 0 2rem;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

/* Logo/網站名稱 */
.top-nav-logo {
  font-size: 1.25rem;
  font-weight: 700;
  color: #1f2937;
  text-decoration: none;
  margin-right: 2rem;
}

.top-nav-logo:hover {
  color: #3b82f6;
}

/* 導航選單容器 */
.top-nav-menu {
  display: flex;
  gap: 1.5rem;
  align-items: center;
  flex: 1;
}

/* 選單連結 */
.top-nav-menu a {
  color: #4b5563;
  text-decoration: none;
  font-weight: 500;
  font-size: 0.95rem;
  padding: 0.5rem 0.75rem;
  border-radius: 0.375rem;
  transition: all 0.2s ease;
}

.top-nav-menu a:hover {
  color: #3b82f6;
  background-color: #f3f4f6;
}

.top-nav-menu a.active {
  color: #3b82f6;
  background-color: #eff6ff;
}

/* 調整主內容區域,避免被導航列遮住 */
.book-page,
.book-menu,
.book-toc {
  padding-top: 60px;
}

/* 手機版樣式 */
@media (max-width: 768px) {
  .top-navigation {
    padding: 0 1rem;
  }
  
  .top-nav-logo {
    font-size: 1.1rem;
    margin-right: 1rem;
  }
  
  .top-nav-menu {
    gap: 0.5rem;
  }
  
  .top-nav-menu a {
    font-size: 0.85rem;
    padding: 0.4rem 0.6rem;
  }
}

/* 深色模式支援 */
@media (prefers-color-scheme: dark) {
  .top-navigation {
    background: #1f2937;
    border-bottom-color: #374151;
  }
  
  .top-nav-logo {
    color: #f9fafb;
  }
  
  .top-nav-logo:hover {
    color: #60a5fa;
  }
  
  .top-nav-menu a {
    color: #d1d5db;
  }
  
  .top-nav-menu a:hover {
    color: #60a5fa;
    background-color: #374151;
  }
  
  .top-nav-menu a.active {
    color: #60a5fa;
    background-color: #1e3a5f;
  }
}
</style>
EOF

# 創建 menu-before.html (導航列 HTML)
echo "📝 創建導航列 HTML..."
cat > layouts/partials/docs/inject/menu-before.html << 'EOF'
<!-- layouts/partials/docs/inject/menu-before.html -->

<nav class="top-navigation">
  <!-- 網站 Logo/名稱 - 請改成你的網站名稱 -->
  <a href="/" class="top-nav-logo">PeaLee.com</a>
  
  <!-- 導航選單 - 可以根據需要修改 -->
  <div class="top-nav-menu">
    <a href="/">首頁</a>
    <a href="/docs/">文件</a>
    <a href="/about/">關於</a>
    <a href="/blog/">部落格</a>
    <a href="/resources/">資源</a>
    <a href="/contact/">聯絡</a>
  </div>
</nav>
EOF

echo "✅ 安裝完成!"
echo ""
echo "📋 下一步:"
echo "1. 編輯 layouts/partials/docs/inject/menu-before.html 來修改選單項目"
echo "2. 執行 'hugo server' 來查看效果"
echo "3. 閱讀 INSTALLATION_GUIDE.md 獲取更多客製化選項"
echo ""
echo "🎉 祝你使用愉快!"
