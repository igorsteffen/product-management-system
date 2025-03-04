# Build Frontend Framewok
FROM node:lts-alpine AS builder

WORKDIR /app

COPY ./app .

FROM nginx:alpine
COPY --from=builder /app /usr/share/nginx/html
COPY default.conf /etc/nginx/confi.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]