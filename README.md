# 🚀 Terraform AWS Python Application

A fully automated infrastructure-as-code project to provision and deploy a simple Python web application on AWS using Terraform.

## 📚 Overview

This project demonstrates how to:
- Use **Terraform** to create AWS infrastructure
- Launch an **EC2 instance** inside a custom **VPC**
- Configure **security groups**
- Deploy a **Flask-based Python web application** automatically using **Terraform provisioners**
- Run everything with a simple `terraform apply`

## 📁 Directory Structure

```bash
.
├── Modules/
│   ├── EC2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── output.tf
│   ├── Security-Group/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── output.tf
│   └── VPC/
│       ├── main.tf
│       ├── variables.tf
│       └── output.tf
├── Scripts/
│   └── install_app.sh         # Script to install Python & deploy the app
├── app/
│   ├── app.py                 # Flask application
│   ├── requirements.txt       # Python dependencies
│   └── templates/
│       └── index.html
├── main.tf
├── variables.tf
├── output.tf
├── provider.tf
├── terraform.tfvars
├── backend.tf
└── README.md
```
## 🧠 Architecture

This setup uses a modular approach to organize resources:

- ✅ VPC Module – Creates a custom VPC, subnets, route tables

- 🔐 Security Group Module – Configures access to EC2 instances

- 🖥 EC2 Module – Launches an Ubuntu EC2 instance and deploys a Python Flask app

## 🛠 Prerequisites

- AWS account with proper IAM permissions

- Terraform installed (>=1.3.0)

- AWS CLI configured

- SSH key pair created in your AWS region

- Git


## 🧪 How It Works

1. Clone the repository:

```bash
git clone https://github.com/your-username/Terraform-AWS-Python-Application.git
cd Terraform-AWS-Python-Application
```

2. Initialize Terraform:

```bash
terraform init
```

3. Apply the configuration:

```bash
terraform apply

```

4. Terraform will:

- Spin up infrastructure

- Copy the Flask app & install_app.sh to the EC2 instance

- Install Python, Flask, and run the app

5. Once done, Terraform will output the public IP of your EC2 instance. Visit the app via:

```bash
http://<your-ec2-public-ip>:5000
```

## 📦 install_app.sh


Here’s what the install_app.sh script does:

- Updates the system

- Installs Python 3 and pip

- Sets up a virtual environment

- Installs app dependencies from requirements.txt

- Starts the Flask application in the background

## 📝 Example install_app.sh

```bash
#!/bin/bash

sudo apt update -y
sudo apt install -y python3-pip python3-venv

cd /home/ubuntu/app
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

nohup python3 app.py > app.log 2>&1 &

```
## ⚠️ Git Best Practices

To avoid accidentally pushing large files like .terraform, make sure your .gitignore includes:

```bash
.terraform/
*.tfstate
*.tfstate.*
*.log
*.pem
*.zip

```
Also, avoid checking in Terraform providers or binaries.

## 🚫 Common Issues

- Large file error on push? Use git-filter-repo to remove .terraform directory from history.

- Flask not found? Ensure requirements.txt contains flask

- SSH timeout? Double-check your key, SG rules, and AMI

## 🧪 Future Improvements

- Add Route53 integration

- Use ALB + Auto Scaling

- Replace provisioners with Ansible or packer-built AMIs

- CI/CD with GitHub Actions and Terraform Cloud


## 🧠 Made with Terraform, Flask, and a lot of ☕ by Ravindu Pahasara ☺️


If you'd like, I can also:
- Personalize it with your GitHub username and project link
- Add markdown badges (Terraform, AWS, GitHub Actions, etc.)
- Include screenshots or architecture diagrams

Let me know what you'd like added!

## 🤝 Contributing
Feel free to fork this repo and contribute with PRs, bug fixes, or suggestions.

## 📄 License
This project is licensed under the MIT License.
