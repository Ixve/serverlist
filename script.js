document.getElementById("420").disabled = true;
globalThis.languagePluginUrl;
globalThis.languagePluginLoader = loadPyodide({indexURL : globalThis.languagePluginUrl});
i = 0

 let response = fetch(
  "https://services.buildandshoot.com/serverlist.json"
)
  .then((response) => response.json())
  .then((response) => {
    for (let i = 0; i < 45; i++) {
      var obj = response[i];
      var element = document.getElementById("aboutme");

      a = document.createElement('a');
      a.innerHTML = obj.identifier;
      a.className = 'x1';

      div = document.createElement('div');
      div.setAttribute("id", i);
      div.className = 'c1';
      div.innerHTML = 'Server: ' + obj.name + ' - - - Players online: ' + obj.players_current + ' - - - ';
      aboutme.insertAdjacentElement('afterend', div)
      var element2 = document.getElementById(i);
      element2.appendChild(a);
    }
    return response;
  })

console.log('Initializing Pyodide');
languagePluginLoader.then(() => { document.getElementById("download").disabled = false; console.log("Ready!") });

let python_code = `
import js
from js import Blob, document, window

def fetch():
  window.fetch('http://services.buildandshoot.com/serverlist.json').then(lambda resp: resp.json()).then(lambda jsoh: show_result(jsoh))

def show_result(data):
  data1 = js.JSON.stringify(data)
  with open('testing.json', 'w') as f:
    f.write(data1)
    with open('/testing.json', 'rt') as x:
        txt = x.read()
        txt
        blob = Blob.new([txt], {type : 'application/text'})
        url = window.URL.createObjectURL(blob);
        window.location.assign(url);
`

languagePluginLoader
  .then(() => pyodide.runPythonAsync(python_code))
