var peripheralNumber = 0;

function addPeripheral(){
    var form = document.getElementById("form");
    
    peripheralNumber++;
    var div = document.createElement("div");
    div.setAttribute("class","form-group");
    var label = document.createElement("label");
    label.setAttribute("for", "Periférico " + peripheralNumber);
    label.innerHTML = "Periférico " + peripheralNumber;
    var input = document.createElement("input");
    input.setAttribute("type", "text");
    input.setAttribute("class","form-control");
    input.setAttribute("id","pName" + peripheralNumber);
    input.setAttribute("name","pName" + peripheralNumber);
    
    div.appendChild(label);
    div.appendChild(input);    
    form.insertBefore(div,document.getElementById("plus"));
    
    
    var div2 = document.createElement("div");
    div.setAttribute("class","form-group");
    var label2 = document.createElement("label");
    label2.setAttribute("for", "Periférico " + peripheralNumber  + "(Patrimônio)");
    label2.innerHTML = "Periférico " + peripheralNumber  + "(Patrimônio)";
    var input2 = document.createElement("input");
    input2.setAttribute("type", "text");
    input2.setAttribute("class","form-control");
    input2.setAttribute("id","pPatrimony" + peripheralNumber);
    input2.setAttribute("name","pPatrimony" + peripheralNumber);    
        
    div2.appendChild(label2);
    div2.appendChild(input2);    
    form.insertBefore(div2,document.getElementById("plus"));
    
    
    document.getElementById("pNumber").value = peripheralNumber;
    
    
}

