# bash wrapper for kano.logger
#
# Copyright (C) 2014 Kano Computing Ltd.
# License: http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
#
# Usage:
#
# . /usr/share/kano-toolset/logger.sh
#
# set_app_name "make-minecraft"
#
# logger_write "Error! Error!"

APP_NAME="$0"

function logger_set_app_name
{
    export APP_NAME="$1"
}

function logger_write
{
    local msg=$1
    local level=$2

    local kwargs=""
    if [ -n "$level" ]; then
        kwargs="$kwargs, level=\"$level\""
    fi

    # Optimisation: Don't launch python unless logging is enabled
    if ( [ -n "$LOG_LEVEL" ] && [ "$LOG_LEVEL" != "none" ] ) \
        || ( [ -n "$DEBUG_LEVEL" ] && [ "$DEBUG_LEVEL" != "none" ] ); then
        python <<EOF
import kano.logger as logger

logger.pid = $$
logger.set_app_name("$APP_NAME")

logger.write("$msg" $kwargs)
EOF
    fi
}