build: clean cilium.yaml

cilium.yaml: clean/cilium.yaml
	kustomize build clean > cilium.yaml

clean/cilium.yaml: values.yaml
	-helm repo add cilium https://helm.cilium.io/
	helm repo update
	helm template cilium cilium/cilium --version 1.10.4 --namespace=cilium --values=values.yaml > $@

diff: cilium.yaml clean/cilium.yaml
	kustomize build . > diff.yaml
	diff cilium.yaml diff.yaml
	rm -f diff.yaml

.PHONY: clean
clean:
	rm -f clean/cilium.yaml
