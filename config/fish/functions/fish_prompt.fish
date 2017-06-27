function fish_prompt --description 'Write out the prompt'
  set suffix '>'
  set -l normal (set_color normal)
  set -U fish_color_user red
  set -U fish_color_host yellow

  echo -n -s $normal "[" (set_color $fish_color_user) (prompt_pwd)  $normal (__fish_vcs_prompt)  $normal "]" @  (set_color $fish_color_host) (prompt_hostname) $normal ' ' $normal  $normal $prompt_status $suffix " "
end
