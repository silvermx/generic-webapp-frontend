# Use the official Node.js image as the base image
FROM node:14 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire Nuxt 3 project to the container
COPY . .

# Build the Nuxt 3 application
RUN npm run build

# Create a production-ready image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy the built Nuxt 3 application from the build stage
COPY --from=build /app/.nuxt ./.nuxt
COPY --from=build /app/static ./static
COPY --from=build /app/package.json ./package.json

# Install only production dependencies
RUN npm install --production

# Expose the port your Nuxt 3 app will run on (usually 3000)
EXPOSE 8080

# Define the command to start your Nuxt 3 app
CMD ["npm", "start"]