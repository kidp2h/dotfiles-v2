
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import ProjectScreen from "./projectorscreen.js";
import PopupWindow from '../.widgethacks/popupwindow.js';

export default (id = 0) => PopupWindow({ 
    monitor: id,
    name: `projector${id}`,
    visible: false,
    keymode: 'on-demand',
    layer: 'overlay',
    exclusivity: 'ignore',
    anchor: ['top', 'bottom', 'left', 'right'],
    child: ProjectScreen({ id: id }),
})
