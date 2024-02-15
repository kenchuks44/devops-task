# Use
FROM node:latest

# Set the working directory inside the container
WORKDIR /home/ubuntu

# Install dependencies
RUN npm install express --save

# Copy the rest of the application code
COPY . .

# Expose the port on which your Express app runs
EXPOSE 3000

# Command to run the application
ENTRYPOINT ["node", "app.js"]
