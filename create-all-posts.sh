#!/bin/bash

# 建立「所有文章」頁面 - 依時間順序列出所有內容
# 使用方法: 在 Hugo 網站根目錄執行

echo "📝 建立「所有文章」頁面..."

# 確認 content 資料夾存在
mkdir -p content

# 建立 all-posts.md
cat > content/all-posts.md << 'EOF'
---
title: "所有文章"
weight: 1
bookFlatSection: false
bookToc: false
---

# 所有文章

以下是所有文章,依發布時間排序(最新在上):

{{< posts-list >}}
EOF

# 建立 shortcode 資料夾
mkdir -p layouts/shortcodes

# 建立 posts-list.html shortcode
cat > layouts/shortcodes/posts-list.html << 'EOF'
{{ $pages := where .Site.RegularPages "Section" "!=" "" }}
{{ $pages = $pages.ByDate.Reverse }}

<div class="posts-list">
{{ range $pages }}
  <div class="post-item" style="margin-bottom: 1.5rem; padding-bottom: 1.5rem; border-bottom: 1px solid #e8e4df;">
    <h3 style="margin-top: 0;">
      <a href="{{ .RelPermalink }}" style="text-decoration: none; color: #1a1a18;">
        {{ .Title }}
      </a>
    </h3>
    
    {{ if .Date }}
    <div style="font-size: 0.875rem; color: #7a756e; margin-bottom: 0.5rem;">
      {{ .Date.Format "2006年01月02日" }}
    </div>
    {{ end }}
    
    {{ if .Summary }}
    <div style="color: #4a4540; line-height: 1.6;">
      {{ .Summary }}
    </div>
    {{ end }}
    
    <a href="{{ .RelPermalink }}" style="font-size: 0.875rem; color: #6b4c2a; text-decoration: none; border-bottom: 1px solid #c4a97d;">
      閱讀全文 →
    </a>
  </div>
{{ end }}
</div>
EOF

echo ""
echo "✅ 完成!"
echo ""
echo "📋 建立的檔案:"
echo "   content/all-posts.md"
echo "   layouts/shortcodes/posts-list.html"
echo ""
echo "📖 使用方法:"
echo "   1. 重啟 hugo server"
echo "   2. 訪問你的網站,側邊欄會出現「所有文章」"
echo "   3. 點進去就能看到所有文章依時間排序"
echo ""
echo "💡 提示:"
echo "   - 文章需要在 front matter 設定 date 才會正確排序"
echo "   - 例如: date: 2026-02-03"
echo ""
SCRIPT

chmod +x create-all-posts.sh