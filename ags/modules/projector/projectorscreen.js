
const { Gdk, Gtk } = imports.gi;
import App from 'resource:///com/github/Aylur/ags/app.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import * as Utils from 'resource:///com/github/Aylur/ags/utils.js';
import { monitors } from '../.commondata/hyprlanddata.js';

const { exec, execAsync } = Utils;

const ProjectorButton = (name, icon, command, props = {}, colorid = 0) => {
    const buttonDescription = Widget.Revealer({
        vpack: 'end',
        transitionDuration: userOptions.animations.durationSmall,
        transition: 'slide_down',
        revealChild: false,
        child: Widget.Label({
            className: 'txt-smaller session-button-desc',
            label: name,
        }),
    });
    return Widget.Button({
        onClicked: command,
        className: `session-button session-color-${colorid}`,
        child: Widget.Overlay({
            className: 'session-button-box',
            child: Widget.Label({
                vexpand: true,
                className: 'icon-material',
                label: icon,
            }),
            overlays: [
                buttonDescription,
            ]
        }),
        onHover: (button) => {
            const display = Gdk.Display.get_default();
            const cursor = Gdk.Cursor.new_from_name(display, 'pointer');
            button.get_window().set_cursor(cursor);
            buttonDescription.revealChild = true;
        },
        onHoverLost: (button) => {
            const display = Gdk.Display.get_default();
            const cursor = Gdk.Cursor.new_from_name(display, 'default');
            button.get_window().set_cursor(cursor);
            buttonDescription.revealChild = false;
        },
        setup: (self) => self
            .on('focus-in-event', (self) => {
                buttonDescription.revealChild = true;
                self.toggleClassName('session-button-focused', true);
            })
            .on('focus-out-event', (self) => {
                buttonDescription.revealChild = false;
                self.toggleClassName('session-button-focused', false);
            })
        ,
        ...props,
    });
}

export default ({ id = 0 }) => {
    // lock, logout, sleep
    // const lockButton = ProjectorButton('Lock', 'lock', () => { closeWindowOnAllMonitors('projector'); execAsync(['loginctl', 'lock-session']).catch(print) }, {}, 1);
    // const logoutButton = ProjectorButton('Logout', 'logout', () => { closeWindowOnAllMonitors('projector'); execAsync(['bash', '-c', 'pkill Hyprland || pkill sway || pkill niri || loginctl terminate-user $USER']).catch(print) }, {}, 2);
    // const sleepButton = ProjectorButton('Sleep', 'sleep', () => { closeWindowOnAllMonitors('projector'); execAsync(['bash', '-c', 'systemctl suspend || loginctl suspend']).catch(print) }, {}, 3);
    // // hibernate, shutdown, reboot
    // const hibernateButton = ProjectorButton('Hibernate', 'downloading', () => { closeWindowOnAllMonitors('projector'); execAsync(['bash', '-c', 'systemctl hibernate || loginctl hibernate']).catch(print) }, {}, 4);
    // const shutdownButton = ProjectorButton('Shutdown', 'power_settings_new', () => { closeWindowOnAllMonitors('projector'); execAsync(['bash', '-c', 'systemctl poweroff || loginctl poweroff']).catch(print) }, {}, 5);
    // const rebootButton = ProjectorButton('Reboot', 'restart_alt', () => { closeWindowOnAllMonitors('projector'); execAsync(['bash', '-c', 'systemctl reboot || loginctl reboot']).catch(print) }, {}, 6);

    const onlySecond = ProjectorButton('Only second', 'looks_two', () => { closeWindowOnAllMonitors('projector'); execAsync(['bash', '-c', 'kanshi -c ~/.config/kanshi/both & sleep 2;kanshi -c ~/.config/kanshi/second-only & killall ags; ags &']).catch(print) }, {}, 6);
    const onlyPrimary = ProjectorButton('Only primary', 'looks_one', () => { closeWindowOnAllMonitors('projector'); execAsync(['bash', '-c', 'kanshi -c ~/.config/kanshi/both & sleep 2;kanshi -c ~/.config/kanshi/primary-only & killall ags; ags &']).catch(print) }, {}, 6);
  
    const topBottom = ProjectorButton('Top - Bottom', 'splitscreen_bottom', () => { closeWindowOnAllMonitors('projector'); execAsync(['bash', '-c', 'kanshi -c ~/.config/kanshi/both & sleep 2;kanshi -c ~/.config/kanshi/top-bottom & killall ags; ags &']).catch(print) }, {}, 6);
    const leftRight = ProjectorButton('Left - Right', 'splitscreen_right', () => { closeWindowOnAllMonitors('projector'); execAsync(['bash', '-c', 'kanshi -c ~/.config/kanshi/both & sleep 2;kanshi -c ~/.config/kanshi/left-right & killall ags; ags &']).catch(print) }, {}, 6);
  
  
    const cancelButton = ProjectorButton('Cancel', 'close', () => closeWindowOnAllMonitors('projector'), { className: 'session-button-cancel' }, 7);

    const sessionDescription = Widget.Box({
        vertical: true,
        css: 'margin-bottom: 0.682rem;',
        children: [
            Widget.Label({
                className: 'txt-title txt',
                label: 'Projector',
            }),
            Widget.Label({
                justify: Gtk.Justification.CENTER,
                className: 'txt-small txt',
                label: 'Use arrow keys to navigate.\nEnter to select, Esc to cancel.'
            }),
        ]
    });
    const ProjectorButtonRow = (children) => Widget.Box({
        hpack: 'center',
        className: 'spacing-h-15',
        children: children,
    });
    const sessionButtonRows = [
        ProjectorButtonRow([onlyPrimary,onlySecond]),
        ProjectorButtonRow([topBottom, leftRight]),
        ProjectorButtonRow([cancelButton]),
    ]
    return Widget.Box({
        className: 'session-bg',
        css: `
        min-width: ${monitors[id].width}px;
        min-height: ${monitors[id].height}px;
        `, // idk why but height = screen height doesn't fill
        vertical: true,
        children: [
            Widget.EventBox({
                onPrimaryClick: () => closeWindowOnAllMonitors('projector'),
                onSecondaryClick: () => closeWindowOnAllMonitors('projector'),
                onMiddleClick: () => closeWindowOnAllMonitors('projector'),
            }),
            Widget.Box({
                hpack: 'center',
                vexpand: true,
                vertical: true,
                children: [
                    Widget.Box({
                        vpack: 'center',
                        vertical: true,
                        className: 'spacing-v-15',
                        children: [
                            sessionDescription,
                            ...sessionButtonRows,
                        ]
                    })
                ]
            })
        ],
        setup: (self) => self
            .hook(App, (_b, name, visible) => {
                if (visible) lockButton.grab_focus(); // Lock is the default option
            })
        ,
    });
}
