# Nuôi Tao - Docker Setup

## Quick Start

### Chạy với Docker Compose

```bash
# Build và chạy
docker compose up -d

# Xem logs
docker compose logs -f

# Dừng
docker compose down

# Rebuild sau khi thay đổi Dockerfile
docker compose up -d --build
```

Website sẽ chạy tại: **http://localhost:8080**

### Chạy với Docker commands

```bash
# Build image
docker build -t nuoi-tam .

# Chạy container
docker run -d -p 8080:80 --name nuoi-tam nuoi-tam

# Xem logs
docker logs -f nuoi-tam

# Dừng container
docker stop nuoi-tam

# Xóa container
docker rm nuoi-tam
```

## Cấu trúc Files

- `Dockerfile` - Docker image configuration
- `docker-compose.yaml` - Docker Compose configuration  
- `nginx.conf` - Nginx server configuration
- `.dockerignore` - Files to ignore khi build

## Development Mode

File `docker-compose.yaml` đã được config với volume mounts, nên bạn có thể:
1. Chạy `docker compose up -d`
2. Edit `main.html` hoặc files trong `img/`
3. Refresh browser - changes sẽ tự động apply (không cần rebuild)

## Production Deployment

Để deploy lên production:

1. **Build image:**
   ```bash
   docker build -t nuoi-tam:latest .
   ```

2. **Push lên registry (nếu cần):**
   ```bash
   docker tag nuoi-tam:latest your-registry.com/nuoi-tam:latest
   docker push your-registry.com/nuoi-tam:latest
   ```

3. **Chạy trên server:**
   ```bash
   docker run -d -p 80:80 --name nuoi-tam --restart always nuoi-tam:latest
   ```

4. **Hoặc dùng docker-compose trên server:**
   - Chỉnh port trong `docker-compose.yaml` thành `80:80`
   - Chạy `docker compose up -d`

## Troubleshooting

### Container không start
```bash
# Check logs
docker compose logs web

# Check container status
docker ps -a
```

### Port đã được sử dụng
Thay đổi port trong `docker-compose.yaml`:
```yaml
ports:
  - "3000:80"  # Thay 8080 thành port khác
```

### Files không update
```bash
# Rebuild container
docker compose down
docker compose up -d --build
```
