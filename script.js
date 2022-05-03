
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
