#!/bin/bash

echo "🚀 Starting Nuoi Tam website..."

# Kiểm tra Docker có cài đặt chưa
if ! command -v docker &> /dev/null; then
    echo "❌ Docker chưa được cài đặt. Vui lòng cài Docker trước."
    exit 1
fi

# Kiểm tra Docker Compose
if command -v docker-compose &> /dev/null; then
    COMPOSE_CMD="docker-compose"
elif docker compose version &> /dev/null; then
    COMPOSE_CMD="docker compose"
else
    echo "❌ Docker Compose chưa được cài đặt."
    exit 1
fi

# Chạy với docker-compose
if [ -f "docker-compose.yaml" ]; then
    $COMPOSE_CMD -f docker-compose.yaml up -d
elif [ -f "docker-compose.yml" ]; then
    $COMPOSE_CMD up -d
else
    echo "❌ Không tìm thấy docker-compose file"
    exit 1
fi

echo "✅ Website đã được khởi động!"
echo "🌐 Truy cập: http://localhost:8080"
echo ""
echo "Để dừng: docker-compose down"
echo "Để xem logs: docker-compose logs -f"

