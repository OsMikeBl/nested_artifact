#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

# Create a simple health check endpoint
echo "<h1>Application Server</h1>" > /var/www/html/index.html
echo "<p>Environment: ${environment}</p>" >> /var/www/html/index.html
echo "<p>Region: ${region}</p>" >> /var/www/html/index.html
echo "<p>Instance ID: $(curl -s http://169.254.169.254/latest/meta-data/instance-id)</p>" >> /var/www/html/index.html

# Health check endpoint
echo "OK" > /var/www/html/health

# Start the web server
systemctl restart httpd