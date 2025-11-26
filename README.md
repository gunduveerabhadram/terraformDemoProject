# 🌟 Terraform Azure Demo Project – Beginner Friendly Guide

This README explains the **complete end-to-end flow** for creating your **first Terraform project on Azure**, using GitHub and Azure resources. It is designed to be simple, clean, and beginner friendly. Diagrams are added for easy understanding.

---

# 📘 **Project Workflow (High-Level Diagram)**

```
+------------------+       +--------------------+       +-------------------+
|   GitHub Repo    | <---> | Local Terraform    | <---> | Azure Cloud       |
|  (Version Control)|       |   Project Code     |       | (Deploy Resources)|
+------------------+       +--------------------+       +-------------------+
```

---

# 🚀 **Terraform Demo Project – Step-by-Step Flow**

## 1️⃣ **Create Git Repository (Remote Project)**

1. Login to **GitHub**
2. Click **New Repository**
3. Repository name: `terraformDemoProject`
4. Choose **Public** or **Private**
5. Optionally add:

   * README
   * `.gitignore`

📌 Your repository is now created.

---

## 2️⃣ **Clone Repository Locally**

Open Git Bash:

```sh
git clone https://github.com/<username>/terraformDemoProject.git
cd terraformDemoProject
```

Your local machine now has an empty Terraform project.

---

## 3️⃣ **Create Terraform Project Structure**

```
terraformDemoProject/
│── main.tf
│── providers.tf
│── variables.tf
│── terraform.tfvars
│── outputs.tf
```

This is a standard and clean Terraform folder structure.

**Diagram – Terraform File Roles**

```
main.tf        → Resource creation (RG, VM, VNet, etc.)
providers.tf   → Azure provider authentication
variables.tf   → Input variables definitions
terraform.tfvars → Values for variables
outputs.tf     → Output values after deployment
```

---

## 4️⃣ **Create Azure Subscription**

If you already have an active subscription, skip.

1. Login → **Azure Portal**
2. Search → **Subscriptions**
3. Click **Create Subscription**
4. Choose plan → Pay-as-you-go / Trial
5. Subscription created
6. Copy your **subscription_id**

---

## 5️⃣ **Create Azure App Registration (Service Principal)**

Terraform requires Azure credentials. Create App Registration:

1. Azure Portal → **Microsoft Entra ID**
2. **App Registrations** → New Registration
3. Name → `terraform-sp`
4. Click **Register**

You will get:

* **Application (client) ID** → `client_id`
* **Directory (tenant) ID** → `tenant_id`

---

## 6️⃣ **Create Client Secret**

1. Inside App Registration
2. Go to **Certificates & Secrets**
3. Click **New client secret**
4. Copy the **VALUE** (this is your `client_secret`)

⚠️ You cannot view it again once you leave the page.

---

## 7️⃣ **Assign RBAC Role to Service Principal**

Your Service Principal needs permissions to deploy.

1. Azure Portal → **Subscriptions**
2. Select your subscription
3. **Access Control (IAM)**
4. Add Role Assignment → **Contributor**
5. Assign it to `terraform-sp`

Now Terraform is authorized to deploy resources.

---

## 8️⃣ **Configure Terraform Provider**

Create **providers.tf**:

```hcl
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}
```

---

## 9️⃣ **Define Variables**

variables.tf:

```hcl
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "resource_group_name" {}
variable "location" {}
```

---

## 🔟 **Add Values in terraform.tfvars**

```hcl
subscription_id      = "xxxxx-xxxxxx-xxxx"
client_id            = "xxxxx-xxxxxx-xxxx"
client_secret        = "xxxxx-secret-value"
tenant_id            = "xxxxx-xxxxxx-xxxx"
resource_group_name  = "rg-demo"
location             = "East US"
```

---

## 1️⃣1️⃣ **Write Resource Code (Example: Resource Group)**

main.tf:

```hcl
resource "azurerm_resource_group" "demo" {
  name     = var.resource_group_name
  location = var.location
}
```

---

## 1️⃣2️⃣ **Initialize & Deploy Terraform**

Run these commands:

```sh
terraform init
terraform plan
terraform apply -auto-approve
```

Terraform will create:

* ✔ Resource Group in Azure
* ✔ Authentication using Service Principal
* ✔ Deployment using Git-managed infrastructure code

---

Summary Of terraform First project:
1.	Create Git Repository
2.	Clone Repository Locally
3.	Create Terraform Project Structure
4.	Create Azure Subscription
5.	Create App Registration (Service Principal)
6.	Create Client Secret
7.	Assign RBAC Role to Service Principal
8.	Configure Terraform Provider
9.	Define Variables
10.	Add Values in terraform.tfvars
11.	Write Resource Code (Example: Resource Group)
12.	Initialize and Deploy Terraform

