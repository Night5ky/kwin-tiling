/********************************************************************
 KWin - the KDE window manager
 This file is part of the KDE project.

Copyright (C) 2012 Mathias Gottschlag <mgottschlag@gmail.com>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*********************************************************************/

import QtQuick 1.1;
/* import org.kde.plasma.core 0.1 as PlasmaCore; */
/* import org.kde.plasma.components 0.1 as Plasma; */
import org.kde.qtextracomponents 0.1 as QtExtra;
import "../code/tilingmanager.js" as Tiling

Item {
    /* property variant tiling */
    Component.onCompleted: {
        console.log("Starting tiling");
        // Initialize tiling
        tiling = new Tiling.TilingManager();
        console.log("Started tiling");
        borderRect.setPosition();
        Tiling.TilingManager.getWCA().connect(borderRect.setPosition);
        console.log("Connected signal");
    }

    Rectangle {
        id: borderRect
        color: "transparent"
        border.color: "blue"
        border.width: 2
        visible: false
        function setPosition() {
            console.log("setPosition");
            borderRect.x = Math.max(Tiling.TilingManager.getActiveClientGeometry().x - 2, 0);
            borderRect.y = Math.max(Tiling.TilingManager.getActiveClientGeometry().y - 2, 0);
            borderRect.width = Math.min(Tiling.TilingManager.getActiveClientGeometry().width + 4, 1366)
            borderRect.height = Math.min(Tiling.TilingManager.getActiveClientGeometry().height + 4, 768)
            if (borderRect.visible != true) {
                console.log("Setting borderRect visible");
                borderRect.visible = true;
            }
            /* console.log(x,y,width,height); */
            console.log("setPosition finished");
        }
    }
}
