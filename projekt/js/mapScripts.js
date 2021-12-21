let zoom = 20;
let lat = 50.061787;
let lon = 19.935243;
let tab = [];
let map = L.map("map").setView([lat, lon], zoom);
let ifadd = false;
var marker
L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution:
        '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);


map.on("click", function (e) {


    tab = e.latlng.toString().replace("LatLng(", "").replace(")", "").split(", ");

    if (ifadd === true) {
        map.removeLayer(marker)
    }
    marker = L.marker([tab[0], tab[1]]).bindPopup(tab[0] + ", " + tab[1]);
    map.addLayer(marker)

    ifadd = true
});