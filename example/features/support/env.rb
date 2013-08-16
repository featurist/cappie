require_relative '../../../lib/cappie'

app_dir = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "app"))

Cappie.start(
  working_dir: app_dir,
  command: "bundle exec rackup",
  await: /9292/,
  host: "http://localhost:9292",
  environment: {foo: 'bar'},
  driver: :poltergeist
)
