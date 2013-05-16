require_relative '../../../lib/cappie'

app_dir = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "app"))
app_path = File.expand_path(File.join(app_dir, "config.ru"))

Cappie.start(
  command: "bundle exec rackup #{app_path}",
  await: /9292/,
  host: "http://localhost:9292",
  environment: {foo: 'bar'},
  driver: :poltergeist
)
