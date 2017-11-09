help:
	terraform --help
%:
	set -a && source ./.env && set +a && terraform $@
plan:
apply:
show:
graph:
	terraform graph | dot -Tpng -o graph.png
