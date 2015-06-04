#
# app.py
#
# Copyright (C) 2015 Kano Computing Ltd.
# License: http://www.gnu.org/licenses/gpl-2.0.txt GNU GPL v2
#
# Utilities for executable scripts
#

import os
import sys

def init_env(app_name, bin_path):
    """
    Initialise the environment for executables.
    """

    dir_path = os.path.abspath(os.path.join(
        os.path.dirname(bin_path), '..'))

    if dir_path != '/usr':
        sys.path.insert(1, dir_path)
        locale_path = os.path.join(dir_path, 'locale')
    else:
        locale_path = None
