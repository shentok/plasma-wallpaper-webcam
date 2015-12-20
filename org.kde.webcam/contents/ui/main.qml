/*
 *  Copyright 2015 Bernhard Beschow <bbeschow@cs.tu-berlin.de>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  2.010-1301, USA.
 */

import QtQuick 2.5

Item {
    id: root

    property Image currentImage: imageA
    property Image otherImage: imageB

    Image {
        id: imageA
        anchors.fill: parent
        source: wallpaper.configuration.url
        fillMode: wallpaper.configuration.FillMode
        cache: false
        visible: true
        z: 1
    }

    Image {
        id: imageB
        anchors.fill: parent
        source: wallpaper.configuration.url
        fillMode: wallpaper.configuration.FillMode
        cache: false
        visible: true
        z: 0
    }

    Timer {
        id: timer
        interval: wallpaper.configuration.SlideInterval * 1000
        repeat: true
        running: true
        onTriggered: {
            var tmp = otherImage;
            otherImage = currentImage;
            currentImage = tmp

            currentImage.z = 1
            otherImage.z = 0
            otherImage.source = "";
            otherImage.source = wallpaper.configuration.url
        }
    }
}
