/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function advanceSearch(){
    var searchFor = new Array();
    var searchTokens = new Array();
    var i = 0;
    
    if(document.getElementById("Setor").value !== null && document.getElementById("Setor").value !== ""){
        searchFor[0] = 1;
        searchTokens[i] = document.getElementById("Setor").value;
        i++;
    }else{
        searchFor[0] = 0;
    }
    if(document.getElementById("Sala").value !== null && document.getElementById("Sala").value !== ""){
        searchFor[1] = 1;
        searchTokens[i] = document.getElementById("Sala").value;
        i++;
    }else{
        searchFor[1] = 0;
    }
    if(document.getElementById("IP").value !== null && document.getElementById("IP").value !== ""){
        searchFor[2] = 1;
        searchTokens[i] = document.getElementById("IP").value;
        i++;
    }else{
        searchFor[2] = 0;
    }
    if(document.getElementById("NPatrimonio").value !== null && document.getElementById("NPatrimonio").value !== ""){
        searchFor[3] = 1;
        searchTokens[i] = document.getElementById("NPatrimonio").value;
        i++;
    }else{
        searchFor[3] = 0;
    }
    if(document.getElementById("DataVerificacao").value !== null && document.getElementById("DataVerificacao").value !== ""){
        searchFor[4] = 1;
        searchTokens[i] = document.getElementById("DataVerificacao").value;
        i++;
    }else{
        searchFor[4] = 0;
    }
    if(document.getElementById("Hostname").value !== null && document.getElementById("Hostname").value !== ""){
        searchFor[5] = 1;
        searchTokens[i] = document.getElementById("Hostname").value;
        i++;
    }else{
        searchFor[5] = 0;
    }
    if(document.getElementById("Processador").value !== null && document.getElementById("Processador").value !== ""){
        searchFor[6] = 1;
        searchTokens[i] = document.getElementById("Processador").value;
        i++;
    }else{
        searchFor[6] = 0;
    }
    if(document.getElementById("RAM").value !== null && document.getElementById("RAM").value !== ""){
        searchFor[7] = 1;
        searchTokens[i] = document.getElementById("RAM").value;
        i++;
    }else{
        searchFor[7] = 0;
    }
    if(document.getElementById("HD").value !== null && document.getElementById("HD").value !== ""){
        searchFor[8] = 1;
        searchTokens[i] = document.getElementById("HD").value;
        i++;
    }else{
        searchFor[8] = 0;
    }
    if(document.getElementById("PlacaVideo").value !== null && document.getElementById("PlacaVideo").value !== ""){
        searchFor[9] = 1;
        searchTokens[i] = document.getElementById("PlacaVideo").value;
        i++;
    }else{
        searchFor[9] = 0;
    }
    if(document.getElementById("OS").value !== null && document.getElementById("OS").value !== ""){
        searchFor[10] = 1;
        searchTokens[i] = document.getElementById("OS").value;
        i++;
    }else{
        searchFor[10] = 0;
    }
    if(document.getElementById("Observacoes").value !== null && document.getElementById("Observacoes").value !== ""){
        searchFor[11] = 1;
        searchTokens[i] = document.getElementById("Observacoes").value;
        i++;
    }else{
        searchFor[11] = 0;
    }
    
    document.getElementById("searchFor").value = searchFor.join(";");
    document.getElementById("searchTokens").value = searchTokens.join(";");
    
    if(i != 0){
        document.getElementById("formAS").submit();
    }
    
}
