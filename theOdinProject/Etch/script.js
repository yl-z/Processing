const WIDTH = 700; //canvas width in px
const HEIGHT = 500; //canvas height in px
const STARTING_SIZE = 8; 
const body = document.querySelector("body");
const canvas = document.createElement("div");
canvas.className = "canvas";

populateCanvas(STARTING_SIZE);

const clrButton = document.querySelector("#clear");
clrButton.addEventListener("mousedown", resetCanvas);


function populateCanvas(size) {
    let numUnitsAcross = Math.floor(WIDTH/size); //max number of whole squares in the horizontal side     //int
    let pixelsInUnit = size;                                                                              //int
    let numUnitsDown = Math.floor(HEIGHT/size); //number of whole squares in vertical side      //int
    let pixelsRemainderAcross = 0.5*(WIDTH%numUnitsAcross);
    let pixelsRemainderDown = 0.5*(HEIGHT%numUnitsDown);
    console.log(WIDTH%numUnitsAcross);

    canvas.style.gridTemplateColumns = `repeat(${numUnitsAcross+2}, auto)`; //+2 accounts for the fragments on either side
    body.appendChild(canvas);

    for (i=0; i < numUnitsDown+2; i++) { //+2 accounts for the fragments on either side which may be blank
        for (j=0; j < numUnitsAcross+2; j++) {
            const unit = document.createElement("div");
            let isBlock = (pixelsRemainderDown!="0px" && pixelsRemainderAcross!="0px");
            if (isBlock) {
                unit.className = "unit";
                unit.setAttribute("data-value", `0`);
                unit.addEventListener("mouseover", colorUnit);

                unit.style.height = `${pixelsInUnit}px`;
                unit.style.width = `${pixelsInUnit}px`;
                unit.style.borderWidth = "1px 1px 0 0";

                let isVerticalEdge = (j==0 || j==numUnitsAcross+1);
                let isHorizontalEdge = (i==0 || i==numUnitsDown+1);
                
                if (isVerticalEdge) {
                    unit.style.width = `${pixelsRemainderAcross}px`;
                    if(j==numUnitsAcross+1) unit.style.borderRight = "0 none black";
                }

                if (isHorizontalEdge) {
                    unit.style.height = `${pixelsRemainderDown}px`;
                    if(i==0) unit.style.borderTop = "0 none black";
                }


            } else {
                unit.className = "blank";
            }
            canvas.appendChild(unit);
        }
    }
}

function colorUnit(event) {
    this.setAttribute("data-value", `${+this.dataset.value+0.1}`);
    this.style.backgroundColor = `rgba(253, 142, 142,${+this.dataset.value})`;
}

function resetCanvas(event) {
    let everything = Array.from(document.querySelectorAll(".unit"));
    for(i=0; i < everything.length; i++) {
        everything[i].remove();
    }

    canvas.remove();

    sizeInput = 0;
    while(sizeInput < 5 || sizeInput > 700 || sizeInput%1 != 0) {
        sizeInput = prompt("Enter size of the pixel. Make it an Integer bigger than 5 and less than 700.");
    }

    populateCanvas(+sizeInput);
}