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

function searchForEvents(txt){

   console.log("hello")
   let list = document.getElementById("ResultRows");
   const xhr = new XMLHttpRequest();
   xhr.onload = function (){
      let json = JSON.parse(xhr.responseText)[0];
      console.log(json)
      list.innerText = json.name +" "+json.city +" "+ json.street + " " +json.building_number + " " + json.time;
   };
   xhr.onerror = function (err){
      console.log(err)
   }
   let url = 'http://localhost:8000/search?name='+ txt;
   console.log(url)
   xhr.open("GET", url, true);
   xhr.send();
}