#!/usr/bin/env bash

complete -W "$(kubectl get secrets -o json | jq  -r  '[.items | .[] | .metadata.name] | join(" ")')" k8secret
