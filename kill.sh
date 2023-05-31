#!/bin/bash
ps aux | grep bw.sh | grep -v grep | awk '{print $2}' | xargs kill -9
pkill -9 curl