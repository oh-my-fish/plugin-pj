# Complete 'open' subcommand when no subcommand given yet
complete --command pj --no-files --condition '__fish_is_first_arg' --arguments 'open' --description 'Open project in editor'

# Complete project names as first argument (no subcommand)
complete --command pj --no-files --condition '__fish_is_first_arg' --arguments '(__project_basenames)'

# Complete project names after 'open' subcommand
complete --command pj --no-files --condition '__fish_seen_subcommand_from open' --arguments '(__project_basenames)'
