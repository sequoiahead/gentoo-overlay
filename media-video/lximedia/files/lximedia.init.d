#!/sbin/runscript
# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

depend() {
	need net
}

start() {
	ebegin "Starting lximedia backend"
        start-stop-daemon --start --exec /usr/bin/lximcbackend -- -s
	eend $? "Failed to start lximedia backend"

}

stop() {
	ebegin "Stopping lximedia backend"
        start-stop-daemon --start --exec /usr/bin/lximcbackend -- -q
	eend $? "Failed to stop lximedia backend"
}
