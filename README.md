
# Terraform GCP Deployment

## Overview

This repository contains Terraform scripts for deploying infrastructure on Google Cloud Platform (GCP). It includes modules for instance and storage management, connectivity through a Virtual Private Cloud (VPC), and firewall rules configuration.

## Project Structure

```
├── main.tf
├── modules
│   ├── instances
│   └── storage
├── README.md
├── terraform.tfstate
└── variables.tf
```

- **main.tf**: Contains the main configuration, including provider setup, module initiation, and resource definitions.
- **modules/**: Directory containing submodules for instances and storage configurations.

## Key Features

- **Provider Configuration**: Set up for GCP with specified project, region, and zone.
- **VPC Network Module**: Efficiently manages network configurations, including subnet creation.
- **Compute Instances Module**: Deploys instances within defined subnets.
- **Storage Module**: Manages Google Cloud Storage resources.
- **Firewall Rules**: Configures firewall to allow web traffic over TCP port 80 from any source.

## Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- A Google Cloud Platform account.
- Service account credentials file with necessary permissions.

### Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/terraform.git
   cd terraform
   ```

2. **Configure Credentials**: Update the `main.tf` file to include your credentials JSON file.
   ```hcl
   provider "google" {
     credentials = file("<YOUR_CREDENTIALS_JSON_FILE>")
     project = "<YOUR_PROJECT_ID>"
     region  = "<YOUR_REGION>"
     zone    = "<YOUR_ZONE>"
   }
   ```

3. **Initialize Terraform**:
   ```bash
   terraform init
   ```

4. **Plan Deployment**:
   ```bash
   terraform plan
   ```

5. **Apply Changes**:
   ```bash
   terraform apply
   ```

6. **Monitor Resources** with GCP Console.

## Notes

- The repository includes backup and state management with Google Cloud Storage.
- Ensure network configurations and IP ranges comply with your organization's security policies.

## Contributions

Contributions are welcome! Please fork this repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License - see the [Apache License 2.0](https://spdx.org/licenses/Apache-2.0.html) file for details.

## Contact

For any questions or support, contact [Your Name] at [your.email@example.com].
