# First build pahse
FROM node:16-alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Second build phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
