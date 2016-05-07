#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# === This file is part of Calamares - <http://github.com/calamares> ===
#
#   Copyright 2014, Anke Boersma <demm@kaosx.us>
#   Copyright 2015, Philip Müller <philm@manjaro.org>
#
#   Calamares is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   Calamares is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with Calamares. If not, see <http://www.gnu.org/licenses/>.

import os
import shutil

import libcalamares



def run():

    install_path = libcalamares.globalstorage.value("rootMountPoint")


    keymap = open(os.path.join("/etc/mudur/keymap")).read()
    language = open(os.path.join("/etc/mudur/language")).read()
    mudur_conf_path = os.path.join(install_path, "etc/conf.d/mudur")

    
    if os.path.exists(mudur_conf_path):
        lines = []
        for line in open(mudur_conf_path, "r").readlines():
            if line.startswith("# keymap="):
                lines.append('keymap=%s\n' % keymap)
            elif line.startswith('# language="tr"'):
                lines.append('language=%s\n'% language) 
            else:
                lines.append(line)
        open(mudur_conf_path, "w").write("".join(lines))



    return None
