const numArea = document.querySelector(".numberArea");
const operatorArea = document.querySelector(".operatorArea");
operators = ["+", "-", "x", "/", ".", "(-)", "c", "="];
let stack = {
    input: "",
    lastOperator: "+",
    lastAnswer: "0",
    appendNums: true,
};

const displayArea = document.querySelector(".result");
displayArea.textContent = stack.lastAnswer;

window.addEventListener("keydown", keyInput);

for (i=9; i>=0; i--) {
    const num = document.createElement("button");
    num.textContent = `${i}`;
    num.setAttribute("data-num", `${i}`);
    num.className = "number";
    num.addEventListener("mousedown", clickInput);
    num.addEventListener("transitionend", clearFormatting);
    numArea.appendChild(num);
}

for (i=0; i<operators.length; i++) {
    const op = document.createElement("button");
    op.textContent = `${operators[i]}`;
    op.className = "operator";
    op.addEventListener("transitionend", clearFormatting);

    if (i<6) {
        if (i>=4) {
            op.style.backgroundColor = "rgba(124, 208, 211, 0.295)"; //color like a number 
            if (operators[i]==".") op.setAttribute("data-num", ".");
            if (operators[i]=="(-)"){
                op.setAttribute("data-num", "-");
                op.innerHTML = "(-) <kbd>n</kbd>";
            } 
            op.addEventListener("mousedown", clickInput);
            operatorArea.appendChild(op);
        } else {
            op.addEventListener("mousedown", clickInput);
            op.setAttribute("data-op", `${operators[i]}`);
            operatorArea.appendChild(op);
        }
    } else {
        op.className = "number"; //size
        op.style.backgroundColor = "rgba(95, 158, 160, 0.15)"; //color like an operator button
        op.addEventListener("mousedown", clickInput);
        op.setAttribute("data-op", `${operators[i]}`);
        if (operators[i] == "=") op.innerHTML = "= <kbd>Enter</kbd>";
        numArea.appendChild(op);
    }
}

const allButtons = Array.from(document.querySelectorAll("button"));
const dotButton = document.querySelector(`[data-num="."]`);
const negButton = document.querySelector(`[data-num="-"]`);

function keyInput(event) {
    if ((event.keyCode >= 48 && event.keyCode <= 57) || event.keyCode == 190 || event.keyCode == 78) { // digits from 0 to 9 and . and n for (-)
        num = document.querySelector(`[data-num = "${event.key}"]`);
        if (event.keyCode == 78) num = document.querySelector(`[data-num = "-"]`);
        if (num) enterNumber(num);
    }
    if ([187, 189, 88, 191, 187, 67, 32, 13].includes(+event.keyCode)) { // +, - , x, /, =, c
        op = document.querySelector(`[data-op = "${event.key}"]`);
        if (event.keyCode == 32 || event.keyCode == 13) op = document.querySelector(`[data-op="="]`);
        if (op) enterOperator(op);
    }
}


function clickInput() {
    if (this.getAttribute("data-num")) enterNumber(this);
    if (this.getAttribute("data-op")) enterOperator(this);
}


function enterNumber(div) {
    div.classList.add("clicked");

    if (stack.appendNums == false) clearEntries();

    if (div.dataset.num == ".") {
        dotButton.classList.add("disabled");
        negButton.classList.add("disabled");
        dotButton.disabled = true;
        negButton.disabled = true;
    }
    if (div.dataset.num == "-") {
        negButton.classList.add("disabled");
        negButton.disabled = true;
    }

    stack.input += div.dataset.num;
    displayArea.textContent = stack.input;
}

function enterOperator(div) {
    div.classList.add("clicked");

    stack.appendNums = true;

    dotButton.classList.remove("disabled");
    negButton.classList.remove("disabled");
    dotButton.disabled = false;
    negButton.disabled = false;

    if (div.dataset.op == "c") {
        clearEntries();
    } else { 
        stack.lastAnswer = `${computeAnswer(stack.lastAnswer, stack.input, stack.lastOperator)}`;
        stack.lastOperator = div.dataset.op;
        stack.input = "";
        if (div.dataset.op == "=") {
            stack.appendNums = false;
        }
    }
    displayArea.textContent = stack.lastAnswer;
}

function computeAnswer(a, b, op) {
    let fn;
    switch (op) {
        case "+":
            fn = add;
        break;
        case "-":
            fn = subtract;
        break;
        case "x":
            fn = multiply;
        break;
        case "/":
            fn = divide;
        break;
        default:
            fn = function (first, second) {return first};
    }
    return Math.round(fn(+a, +b)*10**10) / 10**10;
}

function clearFormatting(e) {
    if(e.propertyName !== 'transform') return;
    this.classList.remove("clicked");
}

function clearEntries() {
    stack = {
        input: "",
        lastOperator: "+",
        lastAnswer: "0",
        appendNums: true,
    };

    for (i=0; i < allButtons.length; i++) {
        allButtons[i].disabled = false;
        allButtons[i].classList.remove("disabled");
    }

}


function add(a, b) {
    return a + b;
}

function subtract(a, b) {
    return a - b;
}

function multiply(a, b) {
    return a * b;
}

function divide(a, b) {
    if (b == 0) {
        clearEntries();
        stack.lastAnswer = "Div by 0 error";
        for (i=0; i < allButtons.length; i++) {
            console.log(allButtons[i]);
            allButtons[i].disabled = true;
            allButtons[i].classList.add("disabled");
        }
        const clearBtn = document.querySelector("[data-op='c']");
        clearBtn.classList.remove("disabled");
        clearBtn.disabled = false;
        return;
    }
    return a / b;
}

