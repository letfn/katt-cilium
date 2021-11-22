package boot

import (
	"github.com/defn/boot"
)

repo: boot.#Repo & {
	repo_name:     "katt-cilium"
	chart_repo:    "https://helm.cilium.io"
	chart_name:    "cilium"
	chart_version: "1.11.0-rc2"
	install:       "cilium"
	namespace:     "kube-system"
	variants: base: values: {
		hubble: {
			ui: enabled:    true
			relay: enabled: true
		}
		operator: replicas:    1
		hostServices: enabled: false
		bpf: masquerade:       false
	}
}
