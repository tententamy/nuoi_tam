@echo off
echo 🚀 Starting Nuoi Tam website...

REM Kiểm tra Docker
docker --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Docker chưa được cài đặt. Vui lòng cài Docker trước.
    pause
    exit /b 1
)

REM Chạy với docker-compose
if exist docker-compose.yaml (
    docker-compose -f docker-compose.yaml up -d
) else if exist docker-compose.yml (
    docker-compose up -d
) else (
    echo ❌ Không tìm thấy docker-compose file
    pause
    exit /b 1
)

echo ✅ Website đã được khởi động!
echo 🌐 Truy cập: http://localhost:8080
echo.
echo Để dừng: docker-compose down
echo Để xem logs: docker-compose logs -f
pause

