# Use Node.js official image
FROM node:18

# Create app directory
WORKDIR /app

# Copy files
COPY package*.json ./
COPY app.js ./

# Install dependencies
RUN npm install

# Expose app port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
