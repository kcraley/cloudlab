# GNU Make
# https://www.gnu.org/software/make/

# Import env vars if required


# --------------------------------------------------
# Terraform Rules
# --------------------------------------------------
.PHONY: init
init:
	terraform init ./terraform

.PHONY: plan
plan:
	terraform plan ./terraform

.PHONY: apply
apply: etcd-init
	terraform apply -auto-approve ./terraform

.PHONY: destroy
destroy:
	terraform destroy -auto-approve ./terraform

# --------------------------------------------------
# ETCD Rules
# --------------------------------------------------
.PHONY: etcd-init
etcd-init:
	bash ./bin/etcd-init.sh
