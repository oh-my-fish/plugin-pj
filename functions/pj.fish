
function pj --description "Jump to a project"
  function __pj_usage
    echo 'Usage: pj [command] [PROJECT]'
    echo 'command:'
    echo '  open  open EDITOR in project directory'
    echo '  pwd   print work directory of project'
    echo '  default command is cd if ommit'
    functions -e __pj_usage
  end

  set -l argc (count $argv)

  if test (count $PROJECT_PATHS) -eq 0
    echo 'Add some directories to the environment variable $PROJECT_PATHS to get started!'
    echo '  set -gx PROJECT_PATHS ~/dir1 ~/dir2'
    return 1

  else if test $argc -le 0 -o $argc -gt 2
    __pj_usage
    return 1

  else if test $argc -eq 2 && ! contains $argv[1] 'open' 'pwd'
    __pj_usage
    return 1

  else if contains -- --help $argv
    __pj_usage

  else if test $argv[1] = "open"
    set -l target (find $PROJECT_PATHS -maxdepth 1 -name $argv[2] | head -n 1)

    if test -n "$target"
      cd $target
      eval $EDITOR $target
    else
      echo "No such project: $argv[2]"
      return 1
    end

  else if test $argv[1] = "pwd"
    set -l target (find $PROJECT_PATHS -maxdepth 1 -name $argv[2] | head -n 1)
    if test -n "$target"
      echo $target
    else
      echo "No such project: $argv[2]"
      return 1
    end

  else
    set -l target (find $PROJECT_PATHS -maxdepth 1 -name $argv[1] | head -n 1)

    if test -n "$target"
      cd $target
    else
      echo "No such project: $argv[1]"
      return 1
    end
  end
end

function __project_basenames --description "List of project basenames"
  set -l project_basenames

  for pp in $PROJECT_PATHS
    set -l contains_files (ls -A $pp 2>/dev/null)

    if test -n "$contains_files"
      set -a project_basenames (basename $pp)
      for project in (ls -d $pp/*/)
        set -a project_basenames (basename $project)
      end
    end
  end

  echo $project_basenames
end
