#!/bin/bash
# Update the system
sudo yum update -y

# Install Node.js and npm (for a Node.js app)
curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
sudo yum install -y nodejs

# Install Git (if your application is stored in a Git repo)
sudo yum install -y git

# Clone your app from a Git repository
cd /home/ec2-user
git clone https://github.com/your-app/app.git
cd app

# Install application dependencies
npm install

# Start the app
nohup npm start > app.log 2>&1 &

# Optionally, configure the app to restart on boot using systemd
echo "[Unit]
Description=My App
After=network.target

[Service]
ExecStart=/usr/bin/node /home/ec2-user/app/app.js
WorkingDirectory=/home/ec2-user/app
Restart=always
User=ec2-user

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/myapp.service

# Reload systemd to apply the new service
sudo systemctl daemon-reload
sudo systemctl start myapp
sudo systemctl enable myapp
