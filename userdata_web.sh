#!/bin/bash
# Update the system
sudo yum update -y

# Install Nginx
sudo yum install -y nginx

# Start Nginx service and enable it to start on boot
sudo systemctl start nginx
sudo systemctl enable nginx

# Create a simple HTML file for the web page
echo "<html>
  <head><title>Welcome to My Web App</title></head>
  <body><h1>Welcome to My Web Application (Web Tier)</h1></body>
</html>" | sudo tee /usr/share/nginx/html/index.html

# Set the correct permissions
sudo chmod 644 /usr/share/nginx/html/index.html

# Restart Nginx to apply changes
sudo systemctl restart nginx

# Optionally, you can also deploy your custom web application here, for example:
# git clone https://github.com/your-app/web-app.git /var/www/html
# cd /var/www/html
# npm install
# npm start
