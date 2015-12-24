function __fish_swiftenv_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'swiftenv' ]
    return 0
  end
  return 1
end

function __fish_swiftenv_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

complete -f -c swiftenv -n '__fish_swiftenv_needs_command' -a '(swiftenv commands)'
for cmd in (swiftenv commands)
  complete -f -c swiftenv -n "__fish_swiftenv_using_command $cmd" -a "(swiftenv completions $cmd)"
end
