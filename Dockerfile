# Sử dụng nginx để serve static files
FROM nginx:alpine

# Copy nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy các file vào thư mục nginx
COPY main.html /usr/share/nginx/html/main.html
COPY img/ /usr/share/nginx/html/img/

# Expose port 80
EXPOSE 80

# Nginx sẽ tự động start
CMD ["nginx", "-g", "daemon off;"]
