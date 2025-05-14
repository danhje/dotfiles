#!/usr/bin/env bash

# Add configuration to launch.json for the specified Python file
# Can be used as a task in VS Code.

target_file="$1"

if [[ ! -f "$target_file" ]]; then
    echo "Error: File '$target_file' not found." >&2
    exit 1
fi

config_name="Run $(basename "${target_file}")"
launch_file=".vscode/launch.json"
mkdir -p .vscode

new_config=$(jq -n \
--arg name "$config_name" \
--arg program "\${workspaceFolder}/${target_file}" \
'{
    name: $name,
    type: "debugpy",
    request: "launch",
    program: $program,
    console: "integratedTerminal"
}')

if [[ -s "$launch_file" ]] && jq empty "$launch_file" 2>/dev/null; then
    tmpfile=$(mktemp)
    jq --argjson newConfig "$new_config" '
        .configurations = (
        (.configurations // []) +
        (if any(.configurations[]?; .name == $newConfig.name) then [] else [$newConfig] end)
        ) | .version = (.version // "0.2.0")
    ' "$launch_file" > "$tmpfile" && mv "$tmpfile" "$launch_file"
else
    jq -n --argjson config "$new_config" '{
        version: "0.2.0",
        configurations: [$config]
    }' > "$launch_file"
fi
