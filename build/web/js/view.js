/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var clicked = false;
function addPeripheral(){
    if(clicked)return;
    else{
    var form = document.getElementById("addPoint");
    
    var div = document.createElement("div");
    div.setAttribute("class","form-group");
    var label = document.createElement("label");
    label.setAttribute("for", "Periférico");
    label.innerHTML = "Periférico";
    var input = document.createElement("input");
    input.setAttribute("type", "text");
    input.setAttribute("class","form-control");
    input.setAttribute("id","pName");
    input.setAttribute("name","pName");    
    
    
    div.appendChild(label);
    div.appendChild(input);
    form.insertBefore(div,document.getElementById("logic"));
    
    var div2 = document.createElement("div");
    div.setAttribute("class","form-group");
    var label2 = document.createElement("label");
    label2.setAttribute("for", "Periférico (Patrimônio)");
    label2.innerHTML = "Periférico (Patrimônio)";
    var input2 = document.createElement("input");
    input2.setAttribute("type", "text");
    input2.setAttribute("class","form-control");
    input2.setAttribute("id","pPatrimony");
    input2.setAttribute("name","pPatrimony"); 
    
    var btn = document.createElement("input");
    btn.setAttribute("type", "submit");
    btn.setAttribute("class","btn bnt-success");
        
    div2.appendChild(label2);
    div2.appendChild(input2);
    div2.appendChild(document.createElement("br"));
    div2.appendChild(btn)
    form.insertBefore(div2,document.getElementById("plus"));
    
    clicked = true;
    }
}


