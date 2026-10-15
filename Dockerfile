FROM nginxinc/nginx-unprivileged:alpine

# Update Alpine packages to fix known vulnerabilities

USER root
RUN apk update && apk upgrade --no-cache

# Copy application files

COPY index.html /usr/share/nginx/html/index.html

# Switch back to non-root user

USER 101

# Expose non-privileged port

EXPOSE 8080
