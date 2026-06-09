#!/bin/bash
# Table & Tine Legal Site — Deploy Script
# Usage: ./deploy.sh (from this directory)
# Pushes changes to GitHub, GitHub Pages auto-deploys

set -e
cd "$(dirname "$0")"

echo "📦 Staging changes..."
git add -A
if git diff --cached --quiet; then
    echo "✅ Nothing to deploy — all up to date"
    exit 0
fi

echo "📝 Committing..."
git commit -m "Update legal pages — $(date +%Y-%m-%d)"

echo "🚀 Pushing to GitHub..."
git push origin main

echo "✅ Deployed! Live at https://tableandtine.com (after DNS is configured)"
echo ""
echo "⚠️  DNS not yet configured. Add these records in Cloudflare:"
echo "    CNAME  @    jgray4567.github.io  (DNS only, grey cloud)"
echo "    CNAME  www  jgray4567.github.io  (DNS only, grey cloud)"