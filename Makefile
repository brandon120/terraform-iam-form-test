ENVIRONMENTS := dev test

MODULES      := modules/folder_iam_member modules/project_iam_member

.PHONY: fmt validate test clean

fmt:
	terraform fmt -check -recursive

validate:
	@set -e; \
	for environment in $(ENVIRONMENTS); do \
		echo "Validating $$environment"; \
		terraform -chdir=$$environment init -backend=false -input=false; \
		terraform -chdir=$$environment validate; \
	done

test:
	@set -e; \
	for module in $(MODULES); do \
		echo "Testing $$module"; \
		terraform -chdir=$$module init -backend=false -input=false; \
		terraform -chdir=$$module test; \
	done; \
	for environment in $(ENVIRONMENTS); do \
		echo "Testing $$environment"; \
		terraform -chdir=$$environment init -backend=false -input=false; \
		terraform -chdir=$$environment test; \
	done

clean:
	@for dir in $(MODULES) $(ENVIRONMENTS); do \
		rm -rf $$dir/.terraform; \
		rm -f $$dir/.terraform.lock.hcl; \
	done
