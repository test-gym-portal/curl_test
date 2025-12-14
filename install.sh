#!/usr/bin/env bash
set -e

echo "📦 Installing template files..."

# 念のため Rails プロジェクトかチェック
if [ ! -f "Gemfile" ]; then
  echo "❌ Gemfileが見つかりません。指定のプロジェクトで実行してください"
  exit 1
fi

# 必要なディレクトリを作成（既存でもOK）
mkdir -p .github/workflows
mkdir -p spec/system spec/model spec/factories

BASE_URL="https://raw.githubusercontent.com/test-gym-portal/curl_test/main"

curl -fsSL "$BASE_URL/.github/workflows/review.yml" \
  -o .github/workflows/review.yml

curl -fsSL "$BASE_URL/.github/workflows/PULL_REQUEST_TEMPLATE.md" \
  -o .github/workflows/PULL_REQUEST_TEMPLATE.md

curl -fsSL "$BASE_URL/spec/system/task_1_spec.rb" \
  -o spec/system/task_1_spec.rb

curl -fsSL "$BASE_URL/spec/system/task_2_spec.rb" \
  -o spec/system/task_2_spec.rb

curl -fsSL "$BASE_URL/spec/factories/user.rb" \
  -o spec/factories/user.rb

curl -fsSL "$BASE_URL/spec/factories/post.rb" \
  -o spec/factories/post.rb

echo "✅ Done!"
