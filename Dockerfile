FROM node:lts-alpine AS react-nx-base
WORKDIR /app
COPY . .
RUN npm ci
RUN npm run build
RUN npm prune --production

FROM nginx:alpine AS react-nx-ui
WORKDIR /usr/share/nginx/html
COPY --from=react-nx-base /app/dist/apps/gke-demo .


