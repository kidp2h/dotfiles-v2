import Widget from "resource:///com/github/Aylur/ags/widget.js";
import SystemTray from "resource:///com/github/Aylur/ags/service/systemtray.js";
const { Box, Icon, Button, Revealer } = Widget;
const { Gravity } = imports.gi.Gdk;

const { Label, Overlay, Scrollable, Stack, EventBox } = Widget;
import { MaterialIcon } from "../../.commonwidgets/materialicon.js";

import { AnimatedCircProg } from "../../.commonwidgets/cairo_circularprogress.js";

import Battery from "resource:///com/github/Aylur/ags/service/battery.js";

const SysTrayItem = (item) =>
  Button({
    className: "bar-systray-item",
    child: Icon({ hpack: "center" }).bind("icon", item, "icon"),
    setup: (self) =>
      self.hook(item, (self) => (self.tooltipMarkup = item["tooltip-markup"])),
    onPrimaryClick: (_, event) => item.activate(event),
    onSecondaryClick: (btn, event) =>
      item.menu.popup_at_widget(btn, Gravity.SOUTH, Gravity.NORTH, null),
  });

const BarBattery = () =>
  Box({
    className: "spacing-h-4 bar-batt-txt",
    children: [
      Revealer({
        transitionDuration: userOptions.animations.durationSmall,
        revealChild: false,
        transition: "slide_right",
        child: MaterialIcon("bolt", "norm", { tooltipText: "Charging" }),
        setup: (self) =>
          self.hook(Battery, (revealer) => {
            self.revealChild = Battery.charging;
          }),
      }),
      Label({
        className: "txt-smallie",
        setup: (self) =>
          self.hook(Battery, (label) => {
            // label.label = `${Number.parseFloat(Battery.percent.toFixed(1))}%`;
            label.label = ``;
          }),
      }),
      Overlay({
        child: Widget.Box({
          vpack: "center",
          className: "bar-batt",
          homogeneous: true,
          children: [MaterialIcon("battery_full", "small")],
          setup: (self) =>
            self.hook(Battery, (box) => {
              box.toggleClassName(
                "bar-batt-low",
                Battery.percent <= userOptions.battery.low,
              );
              box.toggleClassName("bar-batt-full", Battery.charged);
            }),
        }),
        overlays: [BatBatteryProgress()],
      }),
    ],
  });

const BarGroup = ({ child }) =>
  Widget.Box({
    className: "bar-group-margin bar-sides",
    children: [
      Widget.Box({
        className: "bar-group bar-group-standalone bar-group-pad-system",
        children: [child],
      }),
    ],
  });
const BatBatteryProgress = () => {
  const _updateProgress = (circprog) => {
    // Set circular progress value
    circprog.css = `font-size: ${Math.abs(Battery.percent)}px;`;

    circprog.toggleClassName(
      "bar-batt-circprog-low",
      Battery.percent <= userOptions.battery.low,
    );
    circprog.toggleClassName("bar-batt-circprog-full", Battery.charged);
  };
  return AnimatedCircProg({
    className: "bar-batt-circprog",
    vpack: "center",
    hpack: "center",
    extraSetup: (self) => self.hook(Battery, _updateProgress),
  });
};
export const Tray = (props = {}) => {
  const trayContent = Box({
    className: "margin-right-5 spacing-h-15",
    setup: (self) =>
      self.hook(SystemTray, (self) => {
        self.children = SystemTray.items.map(SysTrayItem);
        self.show_all();
      }),
  });
  const trayRevealer = Widget.Revealer({
    revealChild: true,
    transition: "slide_left",
    transitionDuration: userOptions.animations.durationLarge,
    child: trayContent,
  });
  return Box({
    ...props,
    children: [trayRevealer],
  });
};
