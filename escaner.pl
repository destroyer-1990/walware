#!/usr/bin/perl

use IO::Socket;

print "####################################################\n################ESCANER DE PUERTOS##################\n####################################################\n";
print "Coloca 1 para escanear y 2 para salir\n";

$opcion=<STDIN>;
chop($opcion); 
open(ARCHIVO,"config.txt") or die "No se pudo abrir el archivo";
my $port = 445;
if ( $opcion == 1 ) {
     while(<ARCHIVO>){	
          print "escaneando...\n";
          chop($_);        
          $sock = IO::Socket::INET->new(PeerAddr, "$_", PeerPort, "$port",   Proto, 'tcp');
          if ($sock) {      
               print "$port abierto en ip: $_\n";
          } 
          else {   
               print "$port cerrado\n";
          }
     }
}#fin de if 
elsif ( $opcion == 2) {
     print "No hace nada\n";
}
else
     print "Opcion no valida\n";