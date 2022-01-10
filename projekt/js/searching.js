function selectText(){
   let txt = document.getElementById("searchBarInput").value;
   searchForEvents(txt)
}

function selectText2(){
   let txt = document.getElementById("search").value;
   location.href = "searchingResults.html";
   searchForEvents(txt)
}

function selectText3(){
   let txt = document.getElementById("firstname").value;
   location.href = "searchingResults.html";
   searchForEvents(txt)
}

function searchForEvents(txt) {

   const xhr = new XMLHttpRequest();
   xhr.onload = function () {
      const json = JSON.parse(xhr.responseText);
      console.log(json)
      const list = document.getElementById("ResultRows");
      list.innerHTML = "";
      for (let i = 0; i < json.length; i++) {
         const dateAndHour = json[i].date.split("T");
         console.log(json[i].event_id);
         const a = document.createElement("a")
         a.setAttribute("href", "http://localhost:8000/BuyingTicketsForEventPage.html?id=" + json[i].event_id)
         a.setAttribute("class", "list-group-item")
         a.setAttribute("aria-current", "true")
         const div = document.createElement("div")
         div.setAttribute("class", "d-flex w-100 justify-content-between")
         const h5 = document.createElement("h5")
         h5.setAttribute("class", "mb-1")
         const divSmall = document.createElement("small")
         const p = document.createElement("p")
         p.setAttribute("class", "mb-1")
         const small = document.createElement("small")
         h5.innerHTML = json[i].name
         divSmall.innerHTML = dateAndHour[0] + " " + json[i].time
         small.innerHTML = json[i].city + ", " + json[i].street + ", " + json[i].building_number

         const artistsRequest = new XMLHttpRequest();
         artistsRequest.onload = function () {
            const json2 = JSON.parse(artistsRequest.responseText);
            for (let j = 0; j < json2.length; j++) {
               if (j !== 0) {
                  p.innerText += ","
               }
               p.innerText += " " + json2[j].name;
            }
         }
         artistsRequest.open("GET", "http://localhost:8000/artists-in-events/" + json[i].event_id)
         artistsRequest.send();
      div.append(h5, divSmall)
      a.append(div, p, small)
         console.log("list: " + list)
         console.log("a: " + a)
      list.appendChild(a)
}
   }
   xhr.onerror = function (err){
      console.log(err);
   }

   let url = 'http://localhost:8000/search?name=' + txt;
   console.log(url)
   xhr.open("GET", url, true);
   xhr.send();
}

