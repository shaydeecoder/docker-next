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
COPY --from=builder /app/.next ./
ENV NODE_ENV=production
CMD ["npm", "start"]