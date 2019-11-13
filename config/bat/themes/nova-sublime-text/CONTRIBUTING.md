_This assumes you have Bash, Git, Node, and npm_

- Fork repo
- Branch off `master`
- Override your normal Sublime Text colorscheme with the local version you are building in this repo
  - In normal Sublime Text, you can do this with a symbolic link to the `Packages/Colorsublime-Themes` directory like this: `ln -sf "$(pwd)"/colors/Nova.tmTheme ~/Library/Application\ Support/Sublime\ Text 3/Packages/Colorsublime-Themes/Nova.tmTheme`
- Run `npm start` to lint and compile from `src` to `build` folder
- With each change, you will need to run `view.settings().erase("color_scheme")` to see the change, since Sublime Text doesn't reload your theme automatically
- Stage and commit
- Submit a pull request
- Ensure your pull request passes all checks
- Remove your local colorscheme
  - In normal Sublime Text, you can do this by removing the symbolic link to the `Packages/Colorsublime-Themes` directory like this: `rm ~/Library/Application\ Support/Sublime\ Text 3/Packages/Colorsublime-Themes/Nova.tmTheme`
- Once your pull request is merged, update your `nova-sublime-text` plugin to the latest remote version that has your changes in it and make sure everything is working as expected
