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
    
    
    path = os.path.join(install_path, "etc/locale.conf")
    
    mloc = open(path,"r")
    
    languages = mloc.readline(2)

  
    mudur_file_path = os.path.join(install_path, "etc/conf.d/mudur")
    lines = []
    for l in open(mudur_file_path, "r").readlines():
        if l.strip().startswith('language=') or l.strip().startswith('# language='):
            if languages == "pt":
                l = 'language="pt_BR"\n'
            else:
                l = 'language="%s"\n' % languages
        lines.append(l)

    open(mudur_file_path, "w").writelines(lines)
    

    return None
