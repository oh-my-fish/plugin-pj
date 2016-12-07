function pj --description "Jump to a project"
  set -l argc (count $argv)

  if test (count $PROJECT_PATHS) -eq 0
    echo 'Add some directories to the environment variable $PROJECT_PATHS to get started!'
    echo '  set -gx PROJECT_PATHS ~/dir1 ~/dir2'
    return 1

  else if test $argc -le 0 -o $argc -gt 2
    echo 'Usage: pj [open] [PROJECT]'
    return 1

  else if test $argc -eq 2 -a $argv[1] != 'open'
    echo 'Usage: pj [open] [PROJECT]'
    return 1

  else if contains -- --help $argv
    echo 'Usage: pj [open] [PROJECT]'

  else if test $argv[1] = "open"
    set -l target (find $PROJECT_PATHS -mindepth 1 -maxdepth 1 -name $argv[2] | head -n 1)

    if test -n "$target"
      eval $EDITOR $target
    else
      echo "No such project: $argv[2]"
      return 1
    end

  else
    set -l target (find $PROJECT_PATHS -mindepth 1 -maxdepth 1 -name $argv[1] | head -n 1)

    if test -n "$target"
      cd $target
    else
      echo "No such project: $argv[1]"
      return 1
    end
  end
end

