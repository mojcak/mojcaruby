jezik = "slo";
steviloKosara = document.getElementById("kosaraDiv").innerHTML;

$(document).on('click', '#slo', function(){ 
    jezik="slo";
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET","Data/translations.xml",false);
    xmlhttp.send();
    xmlDoc=xmlhttp.responseXML; 
    var x=xmlDoc.getElementsByTagName("translation");
    for (i=0; i<x.length; i++){
        var idTr="#"+x[i].getAttribute('id');
        var beseda=x[i].getElementsByTagName(jezik)[0].childNodes[0].nodeValue;
        if (beseda=="Košarica" || beseda=="Basket"){
            $('#aKosarica').html('');
            var kosaraSt = beseda+"(";

            // stevilo 
            kosaraSt +=steviloKosara+")";
            $("#aKosarica").append(kosaraSt);


           
            naslovKosarica=beseda;
        } else if (beseda=="CD plošče" || beseda=="CD discs"){
            $(idTr).html('');
            $(idTr).append(beseda);
            naslovCD=beseda;
        } else {
            $(idTr).html('');
            $(idTr).append(beseda);
        }
    }
});
$(document).on('click', '#en', function(){ 
    jezik="en";
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET","Data/translations.xml",false);
    xmlhttp.send();
    xmlDoc=xmlhttp.responseXML; 
    var x=xmlDoc.getElementsByTagName("translation");
    for (i=0; i<x.length; i++){
        var idTr="#"+x[i].getAttribute('id');
        var beseda=x[i].getElementsByTagName(jezik)[0].childNodes[0].nodeValue;
        if (beseda=="Košarica" || beseda=="Basket"){
            $('#aKosarica').html('');
            var kosaraSt = beseda+"(";

            kosaraSt +=steviloKosara+")";
            $("#aKosarica").append(kosaraSt);
        } else {
            $(idTr).html('');
            $(idTr).append(beseda);
        }
    }
});
function jeziki(){
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET","Data/translations.xml",false);
    xmlhttp.send();
    xmlDoc=xmlhttp.responseXML; 
    var x=xmlDoc.getElementsByTagName("translation");
    for (i=0; i<x.length; i++){
        var idTr="#"+x[i].getAttribute('id');
        var beseda=x[i].getElementsByTagName(jezik)[0].childNodes[0].nodeValue;
        if (beseda=="Košarica" || beseda=="Basket"){
            $('#aKosarica').html('');
            var kosaraSt = beseda+"(";
            // stevilo 
            kosaraSt +=steviloKosara+")";
            $("#aKosarica").append(kosaraSt);

        } else {
            $(idTr).html('');
            $(idTr).append(beseda);
        }

    }
}

// OK
$(document).ready(function(){
    jeziki();
});
$(document).ready(function(){
    $( "#searchButton" ).click(function() {
        var isci = document.getElementById('searchLabel').value.toLowerCase();
        if (isci.length != 0){
            $.ajax({
                type:"get",
                url:"search.php",
                data:"title="+isci,
                success:function(data){
                    result = $.parseJSON(data);
                    $('#searchLabel').val('');
                    a ='<article>';
                    for (var key in result){
                        for (var key2 in result[key]){
                            if (key2 == 'productPathPicture')
                                pathPic = result[key][key2];
                            else if (key2 == 'productArtist')
                                proArt = result[key][key2];
                            else if (key2 == 'productAlbum')
                                proAlb = result[key][key2];
                            else if (key2 == 'productId')
                                proId = result[key][key2];
                            else if (key2 == 'productPrice')
                                proPri = result[key][key2];
                        }

                        a+='<figure><img class="albumPrikazi" src="'+pathPic+'" alt="'+proArt+'-'+proAlb+'" width="150" height="150" id="';
                        a+=proId+'"/><figcaption><span class="izvajalec">'+proArt+'</span><br />';
                        a+='<span class="album">'+proAlb+'</span><br /><span class="cena">€'+proPri+'</span></figcaption></figure>';
                    }
                    a+='</article>';
                    $('section').html(a);    
                },
                statusCode: {
                    404: function(){
                        $('#searchLabel').val('');
                        $('section').html('Ne najdem iskanih rezultatov...');
                    }
                }
            });
        } 
    });
});
// php se dodatno?
/*
$(document).ready(function(){
    $('#loginForm').validate(
    {
    	rules: {
    		username1: {
    			minlength: 2,
    			required: true
    		},
    		password1: {
    			required: true,
    			minlength: 5
    		}
    	},
    	messages: {
    		username1: {
    			minlength: "Minimalna dolžina je 2",
    			required: ""
    		},
    		password1: {
    			required: "",
    			minlength: ""
    		}
    	},
        
        submitHandler: function(form) {
            uporabnik = ($('#username').val());
            //cookie = $.cookie('Hilda_cookie',uporabnik,);
            $('#prijavaID').replaceWith("Pozdravljen-a, "+uporabnik);
            
            //$('#prijavaID').replaceWith("Pozdravljen-a, "+$.cookie('Hilda_cookie')+"!");

            if (uporabnik == "admin"){
                $('#aKosarica').html(''); 
                if (jezik=="slo")
                    $("#aKosarica").append("Dodaj");
                else 
                    $("#aKosarica").append("Add");
                $('#Kosarica').attr("id", 'DodajAdmin');
                $('#aKosarica').attr("id", 'aDodajAdmin');
                $("#login-box").hide();
                $( "#aDodajAdmin" ).click(function() {
                    $('section').html('');
                    $("section").load("html/Dodaj.html");
                });

            } else {
                $("#login-box").hide();
                //$(form).ajaxSubmit();
            }
        }

    });
});
// php!
*/



function showCDLPdata(b){
    $('section').html('');
    $.ajax({
        type:"get",
        url:"showCDLP.php",
        data:"show="+b,
        success:function(data){
            result = $.parseJSON(data);
            a ='<article>';
            for (var key in result){
                for (var key2 in result[key]){
                    if (key2 == 'productPathPicture')
                        pathPic = result[key][key2];
                    else if (key2 == 'productArtist')
                        proArt = result[key][key2];
                    else if (key2 == 'productAlbum')
                        proAlb = result[key][key2];
                    else if (key2 == 'productId')
                        proId = result[key][key2];
                    else if (key2 == 'productPrice')
                        proPri = result[key][key2];
                }

                a+='<figure><img class="albumPrikazi" src="'+pathPic+'" alt="'+proArt+'-'+proAlb+'" width="150" height="150" id="';
                a+=proId+'"/><figcaption><span class="izvajalec">'+proArt+'</span><br />';
                a+='<span class="album">'+proAlb+'</span><br /><span class="cena">€'+proPri+'</span></figcaption></figure>';
            }
            a+='</article>';
            
            $('section').html(a);   
            
        },
        statusCode: {
            404: function(){
                $('section').html('Zal ni nobenih izdelkov v tej kategoriji');
            }
        }
    });
    
};








$(document).ready(function(){
    $(document).on('click', 'img.albumPrikazi', function(){ 
        $('section').html('');
        var id=this.id;       
        $.ajax({
            type:"get",
            url:"showAlbum.php",
            data:"album="+id,
            success:function(data){
                $('section').html('');
                result = $.parseJSON(data);
                b='';
                if (typeof(result['0']) != 'object')
                    for (var key in result){
                        if (key == 'productPathPicture')
                            pathPic = result[key];
                        else if (key == 'productArtist')
                            proArt = result[key];
                        else if (key == 'productAlbum')
                            proAlb = result[key];
                        else if (key == 'productId')
                            proId = result[key];
                        else if (key == 'productPrice')
                            proPri = result[key];
                    }
                else {
                    b+='<ol>';
                    for (var key in result){    
                        for (var key2 in result[key]){    
                            if (key == 'productPathPicture')
                                pathPic = result[key];
                            else if (key == 'productArtist')
                                proArt = result[key];
                            else if (key == 'productAlbum')
                                proAlb = result[key];
                            else if (key == 'productId')
                                proId = result[key];
                            else if (key == 'productPrice')
                                proPri = result[key];
                            if (key2 == 'albumSongTitle'){
                                songTitle =result[key][key2];
                                b+='<li>'+songTitle;
                            }
                            else if (key2 == 'albumSongPathmp3'){
                                albumSongMp3 = result[key][key2];
                                b+='<audio controls><source src="'+albumSongMp3+'" type="audio/mp3"></audio>';
                            } else if (key2 == 'albumSongPathOgg'){
                                albumSongOgg = result[key][key2];
                                b+='<audio controls><source src="'+albumSongOgg+'" type="audio/ogg">Vaš brskalnik ne podpira avdio značk.</audio></li>';
                            }                        
                        }
                    }
                    b+='</ol>';
                }
                a='<h1>'+proAlb+'</h1><h2>'+proArt+'</h2><figure class="dodajVKosarico">';
                a+='<img src="'+pathPic+'" width="150" height="150" id="'+proId+'" alt="'+ proArt+'-'+proAlb+'"/>';
                a+='<a href="cart.php?action=add&id='+proId+'"><button id="gumbDodajVKosarico">+ Dodaj (€'+proPri+')</button></a>';
                a+='</figure>';
                a+=b;
                $('section').html(a);
                
            },
            statusCode: {
                404: function(){
                    $('section').html('Ne najdem iskanih rezultatov...');
                }
            }
        });
    });   
});