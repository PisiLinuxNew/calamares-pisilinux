/* === This file is part of Calamares - <http://github.com/calamares> ===
 *
 *   Copyright 2015, Teo Mrnjavac <teo@kde.org>
 *
 *   Calamares is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   Calamares is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with Calamares. If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick 2.15
import QtQuick.Controls 2.15
import calamares.slideshow 1.0

Presentation {
    id: presentation

    // Calamares'in seçilen dil kodunu alma (Örn: "tr_TR", "en_US")
    property string currentLang: {
        var lang = String(Qt.uiLanguage || "en").split("_")[0].toLowerCase();
        // Desteklenen diller kontrolü
        if (lang === "tr") return "tr";
        if (lang === "en") return "en";
        return "default"; // Desteklenmeyen dil ise varsayılan
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }
    
    Slide {

        Image {
            id: background1
            source: "slideshow/" + presentation.currentLang + "/slide1.png"
            width: 467; height: 280
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
        Text {
            anchors.horizontalCenter: background1.horizontalCenter
            anchors.top: background1.bottom
            property var titleText: ({
            "tr": "Pisi Linux'a hoşgeldiniz.<br/>"+
                  "Pisi Linux, bağımsız bir topluluk tarafından geliştirilen<br/>"+
                  "son kullanıcı odaklı bir dağıtımdır.",
            "en": "Welcome to Pisi Linux.<br/>"+
                  "Pisi Linux is an end-user-oriented distribution <br/>"+
                  "that was developed by an independent community.",
        })
            text: titleText[presentation.currentLang] || titleText["en"]

            wrapMode: Text.WordWrap
            width: 600
            horizontalAlignment: Text.Center
        }
    }

   Slide {

        Image {
            id: background2
            source: "slideshow/" + presentation.currentLang + "slide3.png"
            width: 467; height: 280
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
        Text {
            anchors.horizontalCenter: background3.horizontalCenter
            anchors.top: background3.bottom
            wrapMode: Text.WordWrap
            width: 600
            horizontalAlignment: Text.Center
        }
    }

    Slide {

        Image {
            id: background3
            source: "slideshow/" + presentation.currentLang + "slide4.png"
            width: 467; height: 280
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
        Text {
            anchors.horizontalCenter: background4.horizontalCenter
            anchors.top: background4.bottom
            wrapMode: Text.WordWrap
            width: 600
            horizontalAlignment: Text.Center
        }
    }

    Slide {

        Image {
            id: background4
            source: "slideshow/" + presentation.currentLang + "slide5.png"
            width: 467; height: 280
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
        Text {
            anchors.horizontalCenter: background5.horizontalCenter
            anchors.top: background5.bottom
            wrapMode: Text.WordWrap
            width: 600
            horizontalAlignment: Text.Center
        }
    }
}
