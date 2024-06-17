// For every option, see ~/.config/ags/modules/.configuration/user_options.js
// (vscode users ctrl+click this: file://./modules/.configuration/user_options.js)
// (vim users: `:vsp` to split window, move cursor to this path, press `gf`. `Ctrl-w` twice to switch between)
//   options listed in this file will override the default ones in the above file

const userConfigOptions = {
  apps: {
    bluetooth: "blueberry",
    imageViewer: "loupe",
    network: 'XDG_CURRENT_DESKTOP="gnome" gnome-control-center wifi',
    settings: 'XDG_CURRENT_DESKTOP="gnome" gnome-control-center wifi',
    taskManager: "gnome-usage",
    terminal: "kitty", // This is only for shell actions
  },
  weather: {
    city: "Ho Chi Minh City",
  },
};

export default userConfigOptions;
