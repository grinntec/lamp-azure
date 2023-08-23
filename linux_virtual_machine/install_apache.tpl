#cloud-config
packages:
  - apache2

apt_update: true
apt_upgrade: true

runcmd:
  - ufw allow 'Apache'
  - chown -R $USER:$USER /var/www
  - |
    echo '<!DOCTYPE html>
    <html>
    <head>
    <title>Apache Web Server</title>
    <meta charset="UTF-8">
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2; /* This will set a light gray background color */
        color: #333; /* This will set the text color to dark gray */
        text-align: center; /* Center align the content */
        padding-top: 50px; /* Add some padding to the top */
      }
      img {
        width: 200px; /* Width of the image */
        height: auto; /* Maintain aspect ratio */
        margin-top: 20px; /* Space above the image */
      }
    </style>
    </head>
    <body>
    <h1>Welcome to the Apache Web Server!</h1>
    <h2>This server was built automatically using Terraform</h2>
    <h3>Hostname: ' $(hostname) '</h3>
    <p>This is a demo page to showcase the automation capabilities of Terraform with cloud-init.</p>
    <!-- Add an image. Replace the URL with your own image link. -->
    <img src="https://images.unsplash.com/photo-1481349518771-20055b2a7b24?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1539&q=80" alt="Demo Image">
    </body>
    </html>' > /var/www/html/index.html
