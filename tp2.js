function somme()
{
    var a = document.getElementById("inputOne").value;
    var b = document.getElementById("inputTwo").value;
var c = Number(a) + Number(b);
result.innerText =c; 
}

function soustraction()
{
    var d = document.getElementById("inputOne").value;
    var e = document.getElementById("inputTwo").value;
var f = Number(d) - Number(e);
result.innerText =f; 
} 

function multiplication()
{
    var g = document.getElementById("inputOne").value;
    var h = document.getElementById("inputTwo").value;
var i = Number(g) * Number(h);
result.innerText =i; 
} 

function division()
{
    var j = document.getElementById("inputOne").value;
    var k = document.getElementById("inputTwo").value;
var l = Number(j) / Number(k);
result.innerText =l; 
} 

function parite()
{         

   var m = Number(document.getElementById("inputOne").value); 
    if (m%2==0) 
result.innerText="Ce nombre est pair";
else 
result.innerText="Ce nombre est impair";

  }

  function permute()
  {
    var n = "";
    a =  document.getElementById("inputOne").value;
    b =   document.getElementById("inputTwo").value;
    n=a;
    a=b;
    b=n;

    inputOne.value = a;
    inputTwo.value = b;
  }