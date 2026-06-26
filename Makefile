ENVIRONMENTS := dev test

.PHONY: fmt validate clean

fmt:
	terraform fmt -check -recursive

validate:
	@set -e; \
	for environment in $(ENVIRONMENTS); do \
		echo "Validating $$environment"; \
		terraform -chdir=$$environment init -backend=false -input=false; \
		terraform -chdir=$$environment validate; \
	done

clean:
	@for environment in $(ENVIRONMENTS); do \
		rm -rf $$environment/.terraform; \
		rm -f $$environment/.terraform.lock.hcl; \
	done
