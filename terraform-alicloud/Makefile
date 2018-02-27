help:
	terraform --help
%:
	set -a && source ./.env && set +a && terraform $@
plan:
apply:
	set -a && source ./.env && set +a && terraform $@ -auto-approve
refresh:
show:
graph:
	terraform graph | dot -Tpng -o graph.png
