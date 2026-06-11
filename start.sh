#!/bin/sh

export DISABLE_MEDUSA_ADMIN=true
export MEDUSA_FF_TELEMETRY=false

echo "Cleaning old build artifacts..."
rm -rf .medusa

pnpm medusa telemetry --disable

echo "Building backend..."
pnpm build

echo "Running database migrations..."
pnpm medusa db:migrate

echo "Seeding database..."
pnpm seed || echo "Seeding failed, continuing..."

echo "Starting Medusa development server..."
pnpm dev
