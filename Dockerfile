#first stage
FROM  node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# next phase
FROM nginx
COPY --from=builder /app/dist/frontend-angular /usr/share/nginx/html

# autostart, niet nodig