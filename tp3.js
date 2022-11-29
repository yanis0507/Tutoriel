function affichage_tableau()
{
document.write("<table border=2; width=30%>");
              for(i=0; i<=5; i++)
              {
                document.write("<tr><td>*</td><td>*</td><td>*</td></tr>")
              }
              document.write("</table>");
}

function affichage_tableau2()
{
              var ligne =  prompt("donner le nombre de ligne à afficher");
                
            
    document.write("<table border=2; width=30%>");
    for(i=0; i<ligne; i++)
    {
      document.write("<tr><td>"+i+"</td><td>*</td><td>*</td></tr>")
    }
    document.write("</table>");
}

function connexion()
{
    var nu = prompt("Veuillez taper votre nom d'utilisateur");
    var mdp = prompt("Veuillez taper votre mot de passe");
    if (nu == "admin" && mdp == "admin") {
      document.write("Bienvenue le mec d'Argenteuil:   "  +nu);
    } else 
    {
        document.write("connexion refusé");
    }  
}

function connexion_boucle()
{
    var i=0;

    do {
        var nu = prompt("Veuillez taper votre nom d'utilisateur");
        var mdp = prompt("Veuillez taper votre mot de passe");

        if(nu =="admin" && mdp == "admin")
        {
            document.write("Bienvenue le mec d'argenteuil:       "+ nu);
            break;
        } 

        else

        alert("Accès refusé");
        i += 1;
    } while (i< 3);
    if (i==3)
    alert("délai dépassé");
}

function  fun_switch()
{
    var color = prompt("entrez une couleur");

    switch(color)
    {
    case "vert": document.body.style.background = "green";;
    break;
    case "VERT": document.body.style.background = "green";;
    break;
    case "bleu": document.body.style.background = "blue";;
    break;
    case "BLEU": document.body.style.background = "blue";;
    break;
        default: alert("couleur non définie");
    }

}