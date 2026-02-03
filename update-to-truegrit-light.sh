#!/bin/bash

# Hugo Book 導航列 - True Grit 淺色 Blog 風格
# 使用方法: 在你的 Hugo 網站根目錄執行

echo "🎨 更新為淺色 Blog 風格..."
echo ""

# 資料夾不存在就建
mkdir -p layouts/partials/docs/inject

# 備份
[ -f "layouts/partials/docs/inject/head.html" ] && cp layouts/partials/docs/inject/head.html layouts/partials/docs/inject/head.html.backup
[ -f "layouts/partials/docs/inject/menu-before.html" ] && cp layouts/partials/docs/inject/menu-before.html layouts/partials/docs/inject/menu-before.html.backup

# ============================================================
# head.html — CSS
# ============================================================
cat > layouts/partials/docs/inject/head.html << 'EOF'
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Inter:wght@400;500&display=swap" rel="stylesheet">

<style>
/* ================================================
   導航列
   ================================================ */
.tg-nav {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 64px;
  background: #faf9f7;
  border-bottom: 1px solid #e8e4df;
  z-index: 1000;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 2.5rem;
}

/* Logo */
.tg-nav__logo {
  font-family: 'Playfair Display', Georgia, serif;
  font-weight: 700;
  font-size: 1.3rem;
  color: #1a1a1a;
  text-decoration: none;
  letter-spacing: -0.01em;
}

.tg-nav__logo:hover {
  color: #6b4c2a;
  text-decoration: none;
}

/* 選單 */
.tg-nav__menu {
  display: flex;
  align-items: center;
  gap: 0.15rem;
}

.tg-nav__menu a {
  font-family: 'Inter', sans-serif;
  font-weight: 500;
  font-size: 0.82rem;
  color: #5a5550;
  text-decoration: none;
  padding: 0.5rem 0.85rem;
  border-radius: 4px;
  letter-spacing: 0.06em;
  text-transform: uppercase;
  transition: color 0.2s, background-color 0.2s;
  white-space: nowrap;
}

.tg-nav__menu a:hover {
  color: #1a1a1a;
  background-color: #f0ece7;
  text-decoration: none;
}

.tg-nav__menu a.active {
  color: #6b4c2a;
  background-color: #efe9e0;
}

/* 分隔線 */
.tg-nav__divider {
  width: 1px;
  height: 16px;
  background-color: #dcd8d2;
  margin: 0 0.5rem;
}

/* ================================================
   內容區域下移
   ================================================ */
.book-page,
.book-menu,
.book-toc {
  padding-top: 64px;
}

/* ================================================
   手機版
   ================================================ */
@media (max-width: 768px) {
  .tg-nav {
    height: 56px;
    padding: 0 1rem;
  }

  .tg-nav__logo {
    font-size: 1.1rem;
  }

  .tg-nav__menu {
    gap: 0;
  }

  .tg-nav__menu a {
    font-size: 0.72rem;
    padding: 0.45rem 0.55rem;
  }

  .tg-nav__divider {
    display: none;
  }

  .book-page,
  .book-menu,
  .book-toc {
    padding-top: 56px;
  }
}

@media (max-width: 400px) {
  .tg-nav__menu a {
    font-size: 0.67rem;
    padding: 0.4rem 0.45rem;
  }
}
</style>
EOF

# ============================================================
# menu-before.html — HTML
# ============================================================
cat > layouts/partials/docs/inject/menu-before.html << 'EOF'
<nav class="tg-nav">
  <a href="/" class="tg-nav__logo">PeaLee</a>

  <div class="tg-nav__menu">
    <a href="/">首頁</a>
    <div class="tg-nav__divider"></div>
    <a href="/docs/">文件</a>
    <a href="/about/">關於</a>
    <a href="/blog/">部落格</a>
    <a href="/resources/">資源</a>
    <div class="tg-nav__divider"></div>
    <a href="/contact/">聯絡</a>
  </div>
</nav>
EOF

# ============================================================
echo ""
echo "✅ 完成!"
echo ""
echo "📋 下一步:"
echo "   1. 按 Ctrl+C 停止 hugo server"
echo "   2. 重新執行: hugo server"
echo "   3. 打開: http://localhost:1313"
echo ""
