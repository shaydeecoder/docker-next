# Multi-stage Dockerfile for a Next.js app

# Build phase
FROM node:20-alpine AS builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run phase
FROM node:20-alpine AS runner
EXPOSE 3000
WORKDIR /app
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/public ./public
COPY --from=builder /app/package.json ./package.json
ENV NODE_ENV=production
CMD ["npm", "start"]