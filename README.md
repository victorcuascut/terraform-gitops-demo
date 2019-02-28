# Terraform GitOps Demo

This project will demonstrate how you can build a single source of truth for your terraform resources and deploy them at scale.

## Getting Started

These instructions get you running a sample set of modules within your own environment and run it continously using GitOps practices.

### Prerequisites

This project will use the following git repositories for its modules and build harness. There is no need to download these projects separately but I would sugest forking the project to meet your business' needs. 

* [terraform-aws-vpc](https://github.com/victorcuascut/terraform-aws-vpc)
* [terraform-config-baseline](https://github.com/victorcuascut/terraform-config-baseline)
* [terraform-route53-private-zone](https://github.com/victorcuascut/terraform-route53-private-zone)
* [terraform-fargate-example](https://github.com/victorcuascut/terraform-fargate-example)

### Setup

In this demo we will be using a version [build-harness](https://github.com/victorcuascut/build-harness) I created to simplify the local development of the manifest and easliy use a CI/CD tool of choice for your deployments.

In this repo you will see a [Makefile](Makefile) that has the following:

```makefile
-include $(shell curl -sSL -o .build-harness "https://victorcuascut.github.io/build-harness"; echo .build-harness)
```

And by running the follow you can initialize the build harness and prepair for deployment.

```shell
make init
make help
```

### Folder Structure
End with an example of getting some data out of the system or using it for a little demo

```
.
└── acmecorp                                                # Business Name or Business Unit
    ├── configs
    │   └── development-account.yml                         # Per account configuration manifest
    └── development-account                                 # Per account Terraform modules to be deployed
        └── us-east-1                                       # Region to deploy to
            ├── demo                                        # VPC to deploy to
            │   ├── demo-fargate-example                    # Application to deploy within the VPC
            │   │   ├── main.tf
            │   │   ├── variables
            │   │   │   └── us-east-1-development.tfvars    # Configurations for this environment
            │   │   └── variables.tf
            │   └── demo-vpc
            │       ├── main.tf
            │       ├── variables
            │       │   └── us-east-1-development.tfvars
            │       └── variables.tf
            ├── global                      # Global modules which are not tied to a specific VPC
            │   └── config-baseline
            │       ├── main.tf
            │       ├── variables
            │       │   └── us-east-1-development.tfvars
            │       └── variables.tf
            └── platform
                ├── platform-route53-private-zone
                │   ├── main.tf
                │   ├── variables
                │   │   └── us-east-1-development.tfvars
                │   └── variables.tf
                └── platform-vpc
                    ├── main.tf
                    ├── variables
                    │   └── us-east-1-development.tfvars
                    └── variables.tf
```

## Manifest
The mainifest is a per account configuration file which defines the module which will be deployed with in the accounts and defines the regions and order they should be deployed in

```yaml
---
business: acme-corp
environment: development

development-account:
    us-east-1:
        - global/config-baseline

        - demo/demo-vpc
        - demo/demo-fargate-example

        - platform/platform-vpc
        - platform/platform-route53-private-zone
```
## Testing
While testing you can from specific project modules under the manifest.The following command will run a terraform plan from the root of the repo

```shell
make manifest/plan -e BUSINESS=acmecorp -e ACCOUNT=develop
ment-account -e PROJECT=global/demo-vpc -e REGION=us-east-1
```

You can also test directly with docker

```
docker run -it -e AWS_DEFAULT_REGION -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -v `pwd`:/workdir victorcuascut/deploy-manifest:1.0.0 -b acmecorp -acc development-account -a plan -p platform/platform-vpc -r us-east-1
```

## Deployment
When you are ready to deploy everything in the manifest run the following command

```shell
make manifest/apply -e BUSINESS=acmecorp -e ACCOUNT=develop
ment-account -e PROJECT=all -e REGION=all
```

Docker version
```
docker run -it -e AWS_DEFAULT_REGION -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -v `pwd`:/workdir victorcuascut/deploy-manifest:1.0.0 -b acmecorp -acc development-account -a apply -p platform/platform-vpc -r us-east-1 --approve=true
```


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


