require "active_record"
require "postgres_adapter"
require "kemal"
require "sentry-run"
require "./ws/*"

Server.new("chat#1").start
