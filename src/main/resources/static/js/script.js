let btnContainer = document.getElementById("flight-status")
let btn = btnContainer.getElementsByClassName("btn")

for(let i = 0; i < btn.length; i++) {
    btn[i].addEventListener("click", function() {
        let current = document.getElementsByClassName("active")
        current[0].className = current[0].className.replace(" active")
        this.className += " active"
    })
}


const tableOne = document.getElementById("sh-1")
const tableTwo = document.getElementById("sh-2")
const arrivalBtn = document.getElementById("arrival")
const departureBtn = document.getElementById("departure")

arrivalBtn.addEventListener("click", function() {
    tableOne.style.display = "block"
    tableTwo.style.display = "none"
})

departureBtn.addEventListener("click", function() {
    tableOne.style.display = "none"
    tableTwo.style.display = "block"
})

let origin = document.getElementById("country");
let destination = document.getElementById("destination");
const abrCountry = document.querySelectorAll(
    ".destination-box .details span small"
);
const countryFieldChanger = document.querySelector(".details i");
let labels = document.querySelectorAll(".destination-box label");

countryFieldChanger.addEventListener("click", () => {
    let temp;
    temp = origin.value;
    origin.value = destination.value;
    destination.value = temp;

    if (destination.value != "" || origin.value != "") {
        labels.forEach((obj) => {
            if (obj.classList.contains("empty")) {
                obj.classList.remove("empty");
            } else {
                obj.classList.add("empty");
            }
        });

        abrCountry.forEach((obj, i) => {
            if (labels[i].classList.contains("empty")) {
                obj.style.visibility = "hidden";
            } else {
                obj.style.visibility = "visible";
            }
        });
    }

});
