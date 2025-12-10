# Nuôi Tao - Website

Trang web đẹp trai và đẳng cấp cho dự án Nuôi Tao.

## Chạy với Docker

### Cách 1: Sử dụng Docker Compose (Khuyến nghị)

```bash
docker-compose up -d
```

Hoặc nếu file tên là `docker-compose.yaml`:

```bash
docker-compose -f docker-compose.yaml up -d
```

Truy cập: http://localhost:8080

### Cách 2: Sử dụng Docker trực tiếp

```bash
# Build image
docker build -t nuoi-tam .

# Chạy container
docker run -d -p 8080:80 --name nuoi-tam-web nuoi-tam
```

Truy cập: http://localhost:8080

### Dừng container

```bash
# Với docker-compose
docker-compose down

# Hoặc với docker
docker stop nuoi-tam-web
docker rm nuoi-tam-web
```

### Xem logs

```bash
docker-compose logs -f
```

### Rebuild sau khi thay đổi code

```bash
docker-compose up -d --build
```

## Cấu trúc thư mục

```
.
├── main.html          # File HTML chính
├── img/               # Thư mục chứa hình ảnh
├── Dockerfile         # Dockerfile để build image
├── docker-compose.yml # Docker Compose config
├── docker-compose.yaml # Docker Compose config (alternative)
├── nginx.conf         # Nginx configuration
├── .dockerignore      # Files to ignore khi build
└── README.md          # File này
```

## Tính năng

- ✅ Nginx với gzip compression
- ✅ Security headers
- ✅ Cache static assets (30 days)
- ✅ Hot reload với volumes (edit file không cần rebuild)
- ✅ Auto restart container

## Lưu ý

- Đảm bảo tất cả hình ảnh đã được đặt trong thư mục `img/`
- Port mặc định là 8080, có thể thay đổi trong `docker-compose.yml`
- Với volumes mount, bạn có thể edit `main.html` và `img/` mà không cần rebuild container
