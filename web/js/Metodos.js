//Funcion para sacar edad de cliente segun numero de identidad
function edadcliente(){
    var id = document.getElementById("txt_id").value;    
    var n1,n2,n3,n4;
    for (var i = 0; i < id.length; i++) {
        if(i===4){
           n1 = id[i];
        }else if(i===5){
           n2 = id[i]; 
        }else if(i===6){
           n3 = id[i]; 
        }
        else if(i===7){
            n4 = id[i];
        }
        
    }
    var anio = n1+n2+n3+n4;
    var edad = 2022-anio;
    
     document.getElementById("txt_edad").value = edad+'';     
}

/*Mapa*/

function mostrar_mapa(){
               
                var ubicacion = new google.maps.LatLng(14.6203, -87.644); //Latitud y Longitud
                //ParÃ¡metros Iniciales
                var opciones={zoom:7, //acercamiento
                    center: ubicacion,
                    mapTypeId: google.maps.MapTypeId.ROADMAP //Las posibles opciones son ROADMAP/SATELLITE/HYBRID/TERRA                    
                };
            
                //Creacion del mapa
                var map = new google.maps.Map(document.getElementById("mapa"),opciones);
                
                
              //recuperar ubicacion donde hago click
                var iw = new google.maps.InfoWindow(
                            {content: 'Haga click sobre el mapa <br> para ver Latitud y Longitud!', 
                             position: ubicacion});
                iw.open(map);
                // configurar evento click sobre el mapa
                map.addListener('click', function(mapsMouseEvent) {                 
                  iw.close();
                  iw = new google.maps.InfoWindow({position: mapsMouseEvent.latLng});
                  iw.setContent(mapsMouseEvent.latLng.toString());
                  iw.open(map);
                  var latitud = mapsMouseEvent.latLng.lat().toString();
                  var longitud = mapsMouseEvent.latLng.lng().toString();
                  document.getElementById('txt_lati').value = latitud;
                  document.getElementById('txt_long').value =  longitud;
                });              
            }
function mostrar_mapamod(){

                var ubicacion = new google.maps.LatLng(14.6203, -87.644); //Latitud y Longitud
                //ParÃ¡metros Iniciales
                var opciones={zoom:7, //acercamiento
                    center: ubicacion,
                    mapTypeId: google.maps.MapTypeId.ROADMAP //Las posibles opciones son ROADMAP/SATELLITE/HYBRID/TERRA                    
                };
            
                //Creacion del mapa
                var mapmod = new google.maps.Map(document.getElementById("mapamod"),opciones);
                
                
              //recuperar ubicacion donde hago click
                var iw = new google.maps.InfoWindow(
                            {content: 'Haga click sobre el mapa <br> para ver Latitud y Longitud!', 
                             position: ubicacion});
                iw.open(mapmod);
                // configurar evento click sobre el mapa
                mapmod.addListener('click', function(mapsMouseEvent) {                 
                  iw.close();
                  iw = new google.maps.InfoWindow({position: mapsMouseEvent.latLng});
                  iw.setContent(mapsMouseEvent.latLng.toString());
                  iw.open(mapmod);
                  var latitud = mapsMouseEvent.latLng.lat().toString();
                  var longitud = mapsMouseEvent.latLng.lng().toString();
                  document.getElementById('mlatitud').value = latitud;
                  document.getElementById('mlongitud').value =  longitud;
                });              
            }
            
  //Modales
  //Usuario
  function mod(pid,pnom,pfec,pdir,ptel,pema,pusu,pcon,prol){
                var modal = document.getElementById("myModal");
                modal.style.display = "block";
                
                document.getElementById("id").value=pid;
                document.getElementById("nom").value=pnom;
                document.getElementById("fecha").value=pfec;
                document.getElementById("dir").value=pdir;
                document.getElementById("tel").value=ptel;
                document.getElementById("email").value=pema;
                document.getElementById("usu").value=pusu;
                document.getElementById("con").value=pcon;
                document.getElementById("rol").value=prol;
            
           }
//Locales
function modloc(plocalid,plocnom,plat,plon){
                var modal = document.getElementById("myModal");
                modal.style.display = "block"; 
                document.getElementById("midloc").value=plocalid;
                document.getElementById("mlocnom").value=plocnom;
                document.getElementById("mlatitud").value=plat;
                document.getElementById("mlongitud").value=plon;
            
           }
//Gerente
//Traslado de usuario a campos de Gerente        
function genusuario(){
        var modal2 = document.getElementById("myModal2");
        modal2.style.display = "block"; 
}

function genusu(pusuid,pusunom){
                document.getElementById("txt_genid").value=pusuid;
                document.getElementById("txt_gennom").value=pusunom; 
                modal2.style.display = "none";                
        }
//Traslado de local a campos de Gerente
function genlocal(){
        var modal3 = document.getElementById("myModal3");
        modal3.style.display = "block"; 
}

function genloc(plocid,plocnom){
                document.getElementById("txt_genlocid").value=plocid;
                document.getElementById("txt_genlocnom").value=plocnom;
                modal3.style.display = "none";   
        }
//Empleado Local
//Traslado de informacion de usuario a Empleado local
function empusuario(){
        var modal4 = document.getElementById("myModal4");
        modal4.style.display = "block"; 
}

function empusu(pusuid,pusunom){
                document.getElementById("txt_empid").value=pusuid;
                document.getElementById("txt_empnom").value=pusunom; 
                modal4.style.display = "none";                
        }
        
//Traslado de informacion de local a Empleado local        
function emplocal(){
        var modal5 = document.getElementById("myModal5");
        modal5.style.display = "block"; 
}

function emplocaldatos(pidloc,pnomloc){
        document.getElementById("txt_empidloc").value=pidloc;
        document.getElementById("txt_emplocnom").value=pnomloc;
        modal5.style.display = "none";
}
//Area
//Asignar Local a la tabla area
function arealocal(){
    var modal6 = document.getElementById("myModal6");
    modal6.style.display = "block";
}

function aemploc(plocid,plocnom){
                document.getElementById("txt_locarea").value=plocid;
                document.getElementById("txt_emplocnom").value=plocnom;
                modal6.style.display = "none";   
        }
//Asignar transferencia al area        
function ttarea(){
        var modal7 = document.getElementById("myModal7");
        modal7.style.display = "block"; 
}

function ttareas(plocid,plocnom){
                document.getElementById("txt_ttid").value=plocid;
                document.getElementById("txt_ttnom").value=plocnom;
                modal7.style.display = "none";   
        }        
         
//Mandar informacion de area para modificar

function modarea(pareaid,plocid,plocnom,pareanom,pidtt,pttipo){
                document.getElementById("txt_midarea").value=pareaid;
                document.getElementById("txt_mlocarea").value=plocid;
                document.getElementById("txt_memplocnom").value=plocnom;
                document.getElementById("txt_modnom").value=pareanom;
                document.getElementById("txt_mttid").value=pidtt;
                document.getElementById("txt_mttnom").value=pttipo;
              
}        
//Modificar Local de un area
function modlocarea(){
        var modal8 = document.getElementById("myModal8");
        modal8.style.display = "block"; 
}

function modlocareadatos(plocid,plocnom){
     document.getElementById("txt_mlocarea").value = plocid;
     document.getElementById("txt_memplocnom").value = plocnom;
     modal8.style.display = "none";
}

//Modificar transaccion de un area
function mttarea(){
        var modal9 = document.getElementById("myModal9");
        modal9.style.display = "block"; 
}

function mttareas(plocid,plocnom){
                document.getElementById("txt_mttid").value=plocid;
                document.getElementById("txt_mttnom").value=plocnom;
                modal9.style.display = "none";   
        }

//Empleado en un Area 
//Asignar empleado que ira con informacion del local al que esta previamente asignado
function locareaemp(){
        var modal10 = document.getElementById("myModal10");
        modal10.style.display = "block";
} 

function locareadatos(plocid,plocnom,pusuid,pusunom){
                document.getElementById("txt_emplocid").value=plocid;
                document.getElementById("aaa").value=plocnom;
                document.getElementById("txt_empid").value=pusuid;
                document.getElementById("txt_empnom").value=pusunom;
                modal10.style.display = "none";
}

function locareadatosgen(plocid,plocnom,pusuid,pusunom){
                document.getElementById("idlocemp").value=plocid;
                document.getElementById("nomlocemp").value=plocnom;
                document.getElementById("idemp").value=pusuid;
                document.getElementById("nomemp").value=pusunom;
                modal10.style.display = "none";
}


//Asignar area a un empleado
function areaemp(){
    var modal11 = document.getElementById("myModal11");
    modal11.style.display = "block";
}

function areadatos(pareaid,pareanom){
                document.getElementById("txt_areaid").value=pareaid;
                document.getElementById("txt_nomarea").value=pareanom;
                modal11.style.display = "none";
}

function areadatosgen(pareaid,pareanom){
                document.getElementById("areaid").value=pareaid;
                document.getElementById("areanom").value=pareanom;
                modal11.style.display = "none";
}

//Asignar empleado que ira con informacion del local para modificar Empleado Area
function mlocareaemp(){
        var modal12 = document.getElementById("myModal12");
        modal12.style.display = "block";
} 

function mlocareadatosgen(plocid,plocnom,pusuid,pusunom){
                document.getElementById("midlocemp").value=plocid;
                document.getElementById("mnomlocemp").value=plocnom;
                document.getElementById("midemp").value=pusuid;
                document.getElementById("mnomemp").value=pusunom;
                modal12.style.display = "none";
}

//Modificar area a un empleado
function mareaemp(){
    var modal13 = document.getElementById("myModal13");
    modal13.style.display = "block";
}

function mareadatosgen(pareaid,pareanom){
                document.getElementById("mareaid").value=pareaid;
                document.getElementById("mareanom").value=pareanom;
                modal13.style.display = "none";
}

function memparead(pidusu,pnomusu,pidloc,pnomloc,pidarea,pnomarea){
            document.getElementById("midemp").value = pidusu;
            document.getElementById("mnomemp").value = pnomusu;
            document.getElementById("midlocemp").value = pidloc;
            document.getElementById("mnomlocemp").value = pnomloc;
            document.getElementById("mareaid").value = pidarea;
            document.getElementById("mareanom").value = pnomarea;
}
//Puestos
function puestos(){
        var modal14 = document.getElementById("myModal14");
        modal14.style.display = "block";
} 

function puestosdatos(pidarea,pnomarea,pidlocal,pnomlocal,pusuid,pusunom){
            document.getElementById("pidarea").value = pidarea;
            document.getElementById("pnomarea").value = pnomarea;
            document.getElementById("pidloc").value = pidlocal;
            document.getElementById("pnomloc").value = pnomlocal;
            document.getElementById("aaidemp").value = pusuid;
            document.getElementById("dsaqwe").value = pusunom;
            
            modal14.style.display = "none";
}
//Ocultar boton de Entrar y Salir en Puestos

function entrar(){
    document.getElementById("entrar").style.display = "none";
    document.getElementById("opci").style.display = "block";
}

function salir(){
        document.getElementsByName("btn_entrar").style.display = "none";
        document.getElementById("salir").style.display = "none";
        document.getElementById("opci").style.display = "none";
}

//Informacion para Cliente
function cliarealocal(){
    var modal20 = document.getElementById("myModal20");
    modal20.style.display = "block";
}
function cliarealocaldatos(plocid,plocnom,pareaid,pareanom){
                document.getElementById("txt_idloc").value=plocid;
                document.getElementById("txt_nomloc").value=plocnom;
                document.getElementById("txt_idar").value=pareaid;
                document.getElementById("txt_nomar").value=pareanom;
                modal20.style.display = "none";   
        }
