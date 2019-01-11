# GNU Make
# https://www.gnu.org/software/make/

# Import env vars if required


# Rules
.PHONY: init
init:
	terraform init ./terraform

.PHONY: plan
plan:
	terraform plan ./terraform

.PHONY: apply
apply:
	terraform apply ./terraform

.PHONY: destroy
destroy:
	terraform destroy ./terraform
