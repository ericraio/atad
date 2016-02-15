#!/usr/bin/env puma

environment 'production'
daemonize false

app_root = "#{File.expand_path('../..', __FILE__)}"

pidfile "#{app_root}/tmp/pids/puma.pid"
state_path "#{app_root}/tmp/pids/puma.state"

threads 8,32
workers 3
preload_app!
