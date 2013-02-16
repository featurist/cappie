require_relative '../../../lib/cappie'

app_path = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "app", "config.ru"))

Cappie.start(
  command: "bundle exec rackup #{app_path}",
  await: /9292/,
  host: "http://localhost:9292"
)