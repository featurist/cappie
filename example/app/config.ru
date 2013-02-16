require 'rack'

html = '''
<html>
  <body>
    <h1>Example App</h1>
    <div id="placeholder">Placeholder</div>
    <script>
      document.getElementById("placeholder").innerHTML = "text created by client-side script";
    </script>
  </body>
</html>
'''

run lambda { |env|
  puts 'GET /'
  [200, {}, [html]]
}