program Jueguito7u7;
uses crt, SysUtils;
const
  limite=1000;
type
  matriz = array[1..limite,1..limite] of string;
  vector= array[1..limite] of integer;
var 
nume,nume2,men,cambio,dn,opma,filas,columnas,mensajevs,explorador,numero,mensaje:string;
numero2,posmorral,modi,menmodi,color,regcolor,a1,b1,t,coma,t1:string;
camb,dnint,fil,col,x,y,opcion,opmodi,cont,posm,varanteriorx,varanteriory,contador: integer;
guardadox,guardadoy,ncolor:integer;
repeticion, repeticion2,cam,dn1,vs,colcom,com,win,bmodi,bmov,vad: boolean;
m,moriginal,n,m_color_ant:matriz;
tecla:char;
a,b,c,d:vector;
ent,ent2,ent3,ent4,sal:text;

function validacion(numero,mensaje:string):boolean;

    var
        validos:string;
        caracter:char;
        n,posi:integer;
    begin
        if mensaje='op' then
            validos:='1234567'
        else
        begin
            if (mensaje='numero') or (mensaje='colores') or (mensaje='valores') or (mensaje='mochila') then 
                validos:='0123456789'
            else 
            begin 
                if mensaje='cambio' then 
                    validos:='12'
                else
                    begin
                        if mensaje='matriz' then 
                            validos:='123';
                    end;
            end;
        end;
        validacion:=true;
        if numero='' then
            validacion:=false
        else 
            begin
                for n:=1 to length(numero) do 
                    begin
                        caracter:=numero[n];
                        posi:=pos(caracter,validos);
                        if posi=0 then 
                            validacion:=false;
                    end;
            end;
end;
function otravalidacion(numero,mensaje:string):boolean;

    var 
        d:integer;
        BEGIN
        d:=strtoint(numero);
            if mensaje='numero' then 
                begin 
                    if (d<2) or (d>15) then 
                        otravalidacion:=false
                    else 
                        otravalidacion:=true;
                end
            else 
                begin 
                    if mensaje='valores' then 
                        begin 
                            if (d<0) or (d>1000) then
                                otravalidacion:=false
                            else 
                                otravalidacion:=true;
                        end
                    else 
                        begin
                            if length(numero)<>1 then
                                otravalidacion:=false
                            else 
                                otravalidacion:=true;
                        end;
                end;
        end;
function validacion_completa(variable,mens:string):boolean;

    var 
        defi:boolean;
    begin
        validacion_completa:=true; 
            if validacion(variable,mens)=true then 
                begin 
               
                    if otravalidacion(variable,mens)=false then
                        defi:=false 
                    else 
                        defi:=true 
                end
            else 
                defi:=false;
            if defi=false then 
                begin 
                    textcolor(12);
                    write('          ');writeln('Invalido, intente de nuevo');
                    write('          ');
                    validacion_completa:=false;
                    textcolor(15);
                    delay(2000);
                end;
    end;
function numerosiguales(num, num2:longint): boolean;
    begin 
        if num=num2 then 
            numerosiguales:=true
        else 
            numerosiguales:=false;
    end;
procedure numeromayor(var num,num2,mayor,menor:longint); 
begin 
    if num2<num then
           begin
                mayor:=num;
                menor:=num2;
           end
        else
            begin
                 mayor:=num2;
                 menor:=num;
            end;
end;
function multiplos(num, num2: longint): boolean;
    var
       mayor,menor:longint;
    begin 
        numeromayor(num,num2,mayor,menor);
        if (mayor=0) or (menor=0) then
           multiplos:=true
        else
            begin
                 if mayor mod menor = 0 then
                    multiplos:=true
                 else
                     multiplos:=false;
            end;
    end;
function triangular(num,num2:longint):boolean;
    var
        i,sum,mayor,menor:longint;
        begin
        numeromayor(num,num2,mayor,menor);
            triangular:=true;
            sum:=0;
            for i:=1 to menor do
                sum:=sum+i;
            if sum<>mayor then
                triangular:=false;
           end;

function primosrelativos(num, num2: longint): boolean;
    var 
    i,m,n:integer;
    begin
     if num>num2 then
      begin
        m:=num;
        n:=num2;
      end;
      if num2>num then 
      begin
       m:=num2;
       n:=num;
      end;
        primosrelativos:=true;
     for i:=2 to n do
      begin
      if (num mod i=0) and (num2 mod i=0) then
       primosrelativos:=false;
      end;
    end;
function contar(num: longint):integer;
    var 
        digito: longint;
        cont:integer;
    begin
         if num=0 then
            contar:=1
         else
             begin
                  cont:=0;
                  while num<>0 do
                        begin
                             digito:=num mod 10;
                             num:=num div 10;
                             cont:=cont + 1;
                        end;
                  contar:=cont;
             end;
    end;
function contenido(num,num2:longint):boolean;
    var 
        s,s2:string;
        posi:integer;
    begin 
    contenido:=true;
        if contar(num)>contar(num2) then 
            begin
                s:=IntToStr(num);
                s2:=IntToStr(num2);
            end
        else 
            begin 
                s:=IntToStr(num2);
                s2:=IntToStr(num);
            end;
        posi:=pos(s2,s);
        if posi=0 then 
            contenido:=false;
    end;
function inversos(num, num2: longint):boolean;
    var
        digito, nuevonumero:longint;
    begin
        nuevonumero:=0;
        inversos:=false;
            while num<>0 do 
                begin 
                    digito:=num mod 10;
                    nuevonumero:=(nuevonumero*10)+digito;
                    num:=num div 10;
                end;
                    if nuevonumero=num2 then
                        inversos:=true;
    end;
function divisores(num, num2:longint):boolean;
    var 
        divisor, suma: longint;
    begin
        divisores:=false;
        divisor:=1;
        suma:=0;
            while divisor<num do 
                begin 
                    if num mod divisor = 0 then 
                        suma:=suma + divisor;
                    divisor:=divisor + 1;
                end;
        if suma=num2 then 
            divisores:=true;
    end;
function numerosamigos(num, num2:longint):boolean;
    begin
        numerosamigos:=false;
        if (divisores(num,num2)=true) and (divisores(num2,num)=true) then 
            numerosamigos:=true;
    end;
procedure espacios(valor:string);
{Hace que la matriz se vea simetrica}
begin 
    if length(valor)=1 then
        write('   ')
    else
        begin
            if length(valor)=2 then
                write('  ')
            else 
                write(' ');
        end;
end;
function compatible(numero,numero2: string):boolean;

    var 
        h:boolean;
        num,num2:longint;
    begin
        if numero='  ' then //piedras grises
            h:=false
        else 
        begin
        num:=StrToInt(numero); 
        num2:=StrToInt(numero2);
        if numerosiguales(num,num2) then
            h:=true
        else 
            begin
                if multiplos(num,num2) then
                    h:=true
                else
                    begin 
                        if triangular(num,num2) then
                            h:=true
                        else
                            begin 
                                if primosrelativos(num,num2) then
                                    h:=true
                                else 
                                    begin 
                                        if contenido(num,num2) then 
                                            h:=true
                                        else
                                            begin 
                                                if inversos(num,num2) then
                                                    h:=true
                                                else
                                                    begin 
                                                        if numerosamigos(num,num2) then 
                                                            h:=true
                                                        else 
                                                            h:=false;
                                                    end;
                                            end;
                                    end;
                            end;
                    end;
            end;
        end;
        compatible:=h;
    end;
procedure llenar_matriz_random(var m,moriginal:matriz; fil,col,posm:integer);

var
  i,j:integer;
  numero:string;
begin
  randomize;
  for i:=1 to fil do
     begin
       for j:=1 to col do
         begin
            if (i=1) and (j=posm) then
                begin
                    m[i,j]:='#';
                    moriginal[i,j]:=m[i,j];
                end
            else 
                begin
                    if (i=1) or (i=fil) then 
                        begin
                            m[i,j]:='____';
                            moriginal[i,j]:=m[i,j];
                        end
                    else 
                        begin
                            numero:=IntToStr(random(1000));
                            m[i,j]:=numero;
                            moriginal[i,j]:=m[i,j];
                        end;
                end;
         end;
     end; 
end;
function valor_color(var color:string):string;
begin 
    if color='0' then 
        valor_color:='7';
    if color='1' then 
        valor_color:='1';
    if color='2' then 
        valor_color:='2';
    if color='3' then 
        valor_color:='3';
    if color='4' then 
        valor_color:='5';
    if color='5' then 
        valor_color:='9';
    if color='6' then 
        valor_color:='10';
    if color='7' then 
        valor_color:='11';
    if color='8' then 
        valor_color:='13';
    if color='9' then 
        valor_color:='14';
end;
procedure colores(var n,m_color_ant,m,moriginal:matriz; fil,col:integer);
var
  i,j:integer;
  numero,num:string;
begin
  randomize;
  for i:=1 to fil do
     begin
       for j:=1 to col do
         begin
            if (i=1) or (i=fil) then 
                numero:='0' 
            else 
                begin 
                    num:=IntToStr(random(10)); 
                    numero:=valor_color(num);
                    m_color_ant[i,j]:=num; 
                                            
            
                    if num='0' then 
                        begin
                            m[i,j]:='  ';
                            moriginal[i,j]:='  ';
                        end;
                end;
            n[i,j]:=numero; 
         end;
     end; 
end;
procedure reanudarmatriz(var m,moriginal:matriz; fil,col,posm:integer);
 
    var 
        i,j:integer;
    begin 
        for i:=1 to fil do 
            begin 
                for j:=1 to col do 
                    begin 
                        if (i=1) and (j=posm) then
                            m[i,j]:='#'
                        else 
                            begin
                                if (i=1) or (i=fil) then 
                                    m[i,j]:='____'
                                else
                                    begin
                                        m[i,j]:='';
                                        moriginal[i,j]:=m[i,j];
                                    end;
                            end;
                    end;
            end;
    end;
function compatiblecolor(pos,co:string):boolean;
 
var 
    posicion,color:integer;
begin 
    compatiblecolor:=true;
    posicion:=StrToInt(pos);
    color:=StrToInt(co);  
    compatiblecolor:=false;
    if (posicion=0) then  
        compatiblecolor:=false
    else
        begin
            case color of  
            1:Begin 
                if (posicion=color+1) or (posicion=color+2) then
                    compatiblecolor:=true;
            end;
            2,3,4,5,6,7:Begin 
                if (posicion=color-1) or (posicion=color+1) or (posicion=color+2) or (posicion=color-2) then
                    compatiblecolor:=true;
            end;
            8:Begin 
                if (posicion=color+1) or (posicion=color-1) or (posicion=color-2) then 
                    compatiblecolor:=true;
            end;
            9:Begin 
                if (posicion=color-1) or (posicion=color-2) then 
                    compatiblecolor:=true;
            end;
            end;
        end;
end;
procedure reanudarvector(var a:vector; var cont:integer);
 
var 
    i:integer;
begin 
    for i:=1 to cont do 
            a[i]:=0;
end;      
procedure coloresidentificados;
 begin 
    Write('                               ');writeln('Azul = 1');
    Write('                               ');writeln('Verde = 2');
    Write('                               ');writeln('Cian = 3');
    Write('                               ');writeln('Magenta = 4');
    Write('                               ');writeln('Azul claro = 5');
    Write('                               ');writeln('Verde claro = 6');
    Write('                               ');writeln('Cian claro = 7');
    Write('                               ');writeln('Rosado = 8');
    Write('                               ');writeln('Amarillo = 9');
end;
procedure leer_archivo(var c,z:text;var fil,col:integer);
 var
    con,pal:string;
    conta,posicion:integer;
begin
    reset(c);  rewrite(z);
    if eof(c) then
        writeln('Archivo vacio')
    else
        begin
            conta:=1;
            pal:='';
            while not(eof(c)) do
                begin
                    readln(c,con);
                    for posicion:=1 to length(con) do
                        begin
                            if copy(con,posicion,1)<>' ' then
                                pal:=pal+copy(con,posicion,1);
                            if (copy(con,posicion,1)=' ') or (posicion=length(con)) then
                                begin
                                    if conta=1 then
                                        begin
                                            fil:=strtoint(pal);
                                        end;
                                    if conta=2 then
                                        begin
                                            col:=strtoint(pal);
                                        end;
                                    if conta>=3 then
                                        begin
                                            if pal<>'' then;
                                                begin 
                                                    writeln(z,pal);
                                                end; 
                                        end;
                                    conta:=conta+1;
                                    pal:='';
                                end;
                        end;

                end;

        end;
        close(c);
        close(z);
end;
procedure larchivo(var z,w,k:text; var ncolor,fil,col:integer; var m_color_ant,m,n:matriz);
var
    save,pal,pal2:string;
    posicion,conta:integer;
begin
    reset(z); rewrite(w);  rewrite(k);
    conta:=0;
    pal:='';
    pal2:='';
    while not(eof(z)) do
        begin
            conta:=0;
            readln(z,save);
            for posicion:=1 to length(save) do
                begin
                    if copy(save,posicion,1)<>' ' then
                        begin
                            if posicion=1 then
                                pal:=pal+copy(save,posicion,1);
                            if posicion<>1 then
                                pal2:=pal2+copy(save,posicion,1);
                        end;
                    if (copy(save,posicion,1)=' ') or (posicion=length(save)) then
                        begin
                            writeln(w,pal);
                            writeln(k,pal2);
                        end;
                end;
                pal:='';
                pal2:='';
        end;
    close(z); close(w); close(k);
end;
procedure matrizarchivo(var k,z:text; var m,moriginal,m_color_ant,n:matriz; var fil,col,posm:integer);
  var
  i,j:integer;
  w,s:string;
   begin
        reset(z); reset(k);
        for i:=fil downto 1 do
         begin
          for j:=1 to col do
            begin
                if (i=1) and (j=posm) then 
                    begin
                        m[i,j]:='#';
                        n[i,j]:='0'; 
                    end
                else
                    begin
                        if (i=fil) or (i=1) then 
                            begin
                                m[i,j]:='____';
                                n[i,j]:='0';
                            end
                        else
                            begin
                                readln(z,w); 
                                m[i,j]:=w;
                                readln(k,s);
                                m_color_ant[i,j]:=s;
                                n[i,j]:=valor_color(s);
                                if n[i,j]='7' then 
                                   m[i,j]:='  ';
                            end;
                    end;
                moriginal[i,j]:=m[i,j];
            end;
        end;
        close(z); close(k);
    end;
procedure llenar_matriz_manual(var m,moriginal,n,m_color_ant:matriz; fil,col,posm:integer);
var
  i,j,h,k,c:integer;
  mensaje:string;
  ma:boolean;
begin
  for i:=fil downto 1 do
     begin
       for j:=1 to col do
         begin
            if (i=1) and (j=posm) then
                m[i,j]:='#' {mochila}
            else 
                begin
                    if (i=1) or (i=fil) then 
                        begin
                            n[i,j]:='0'; {negro}
                            m[i,j]:='____';
                        end
                    else

                        repeat 
                            begin
                                repeat 
                                    repeat
                                        writeln;
                                        writeln('Indique el color de la posicion: [',i, ',' ,j,']');
                                        writeln('Si desea añadir una piedra caida escriba "0" '); 
                                        coloresidentificados;
                                        readln(n[i,j]);
                                        mensaje:='colores';
                                        ma:=validacion_completa(n[i,j],mensaje);
                                    until ma=true;
                                    m_color_ant[i,j]:=n[i,j];
                                    n[i,j]:=valor_color(n[i,j]);
                                    if n[i,j]='7' then
                                        m[i,j]:='  '
                                    else
                                        begin
                                            writeln;
                                            writeln('Indique el valor de la posicion: [',i,',',j,']');
                                            readln(m[i,j]);
                                            mensaje:='valores';
                                            ma:=validacion_completa(m[i,j],mensaje); 
                                        end;
                                    If (m[i,j]='  ') and (n[i,j]<>'7') then
                                        begin 
                                            textcolor(4);
                                            writeln;
                                            writeln('Intente de nuevo');
                                            textcolor(15);
                                        end;
                                until (m[i,j]<>'  ') or (n[i,j]='7'); 
                                if ma=false then 
                                    begin 
                                        textcolor(4);
                                        writeln;
                                        writeln('Solo puede contener caracteres numericos');
                                        textcolor(15);
                                    end;
                            end;
                        until ma=true;
                end;
            moriginal[i,j]:=m[i,j];
            ClrScr;
            for h:=1 to fil do
                begin
                    for k:=1 to col do
                        begin
                            c:=strtoint(n[h,k]);
                            textbackground(c);
                            write(m[h,k]);
                            if m[h,k]<>'____' then
                                espacios(m[h,k]);
                        end;
                    textbackground(0);
                    writeln;
                end;
        end; 
     end;  
end; 
procedure leernumeros(var nume:string;mensaje:string);

var
 v1:boolean;
    begin
        repeat
            write('  ');readln(nume);
            v1:=validacion_completa(nume,mensaje);
        until v1=true;
        clrscr;
    end;
procedure imprimir_matriz(var m:matriz; fil,col:integer);
var
  i,j:integer;
begin
  writeln;
  writeln('Contenido de la Matriz: ');
  for i:=1 to fil do
     begin
       for j:=1 to col do
         begin
            write(m[i,j]);
            espacios(m[i,j]);
         end;
       writeln; 
     end; 
end;
procedure reanudarcolores(var n:matriz; fil,col:integer);
var 
    i,j:integer;
begin 
    for i:=1 to fil do
        begin 
            for j:=1 to col do
                n[i,j]:='0'; {todo en negro}
        end;
end;
procedure movimiento(var m,m_color_ant:matriz; var x,y:integer;varanteriorx,varanteriory,fil:integer; explorador,regcolor:string);

var 
    com,colm:boolean;
begin 
    if (m[x,y]<>'____') then 
        begin
            com:=compatible(m[x,y],explorador);
            colcom:=compatiblecolor(m_color_ant[x,y],regcolor);
            if (com=false) and (colcom=false) then
                begin
                    x:=varanteriorx; 
                    y:=varanteriory;
                    writeln('Movimiento invalido');
                end
        end
    else 
        if x=1 then 
            begin 
                x:=varanteriorx;
                y:=varanteriory;
                writeln('Movimiento invalido');
            end;
end;
function movinvalido(var x,y,varanteriorx,varanteriory,contador,guardadox,guardadoy:integer):boolean;

begin 
    movinvalido:=true;
    if (x=varanteriorx) and (y=varanteriory) then 

        begin
            if (guardadox=x) and (guardadoy=y) then

                    contador:=contador+1
            else
                begin
                    contador:=1;
                    movinvalido:=true;
                end;
        end
    else 
        begin
            contador:=0;
            movinvalido:=true;
        end;
    if contador=1 then
        begin
            writeln;
            writeln('Si tropiezas nuevamente en la misma piedra');
            writeln('se reiniciara el juego');
            movinvalido:=true;
            guardadox:=x;
            guardadoy:=y;
            delay(2000);
        end;
    if (contador=2) and (x=guardadox) and (y=guardadoy) then 
        movinvalido:=false; 
end;
procedure reiniciar(var x,y,varanteriorx,varanteriory,contador,cont,guardadox,guardadoy:integer; var a,b:vector);
begin 
    bmov:=movinvalido(x,y,varanteriorx,varanteriory,contador,guardadox,guardadoy);
    if bmov=false then 
        begin 
            x:=fil; y:=1; 
            reanudarvector(a,cont);
            reanudarvector(b,cont);
            cont:=1;
        end;
end;
procedure menuopciones(var repeticion2,repeticion,win:boolean);
var 
    modi,menmodi:string;
    bmodi:boolean;
    opmodi:integer;
begin 
    bmodi:=false;
    repeat
        writeln;
        writeln;
        textcolor(14);
        write('    '); writeln('OPCIONES');
        textcolor(15);
        write('   ');writeln('1.Cambiar el mapa');
        write('   ');writeln('2.Reiniciar datos del juego');
        write('   ');writeln('3.Salir');
        readln(modi);
        menmodi:='matriz';
        bmodi:=validacion_completa(modi,menmodi);
    until bmodi=true;
    opmodi:=strtoint(modi);
    case opmodi of 
        1:begin
        repeticion2:=true;
        win:=true;
        end;
        2:begin 
            repeticion2:=false;
            repeticion:=true;
            win:=true;
        end;
        3:begin 
            repeticion:=false;
            repeticion2:=false;
            win:=true;
        end;
    end;
end;
procedure matriz_interactiva(var m,moriginal,n:matriz; fil,col,x,y,cont:integer; explo,colexplo:string; var a,b:vector);
var
  i,j,h,c,color:integer;
  cr:string;
begin
  writeln;
  textcolor(15);
  writeln;
  writeln('Contenido de la Matriz: ');
  for i:=1 to fil do
     begin
       for j:=1 to col do
         begin
            c:=strtoint(n[i,j]);
            textbackground(c);
            if (i=x) and (j=y)then
                begin 
                    textcolor(10);
                    color:=strtoint(colexplo); 
                    textbackground(color);
                    m[i,j]:=explo;
                    write(m[i,j]);
                    textcolor(15);
                    if m[i,j]<>'____' then
                        espacios(m[i,j]);
                end
            else 
                begin
                    h:=0;
                    textcolor(15); 
                    repeat
                            if (i=a[h]) and (j=b[h]) then
                                textcolor(4);
                            h:=h+1;
                    until h=cont;    
                    m[i,j]:=moriginal[i,j]; 
                    write(m[i,j]);
                    if m[i,j]<>'____' then 
                        espacios(m[i,j]);
                end;
        end;
        textbackground(0);
        writeln;
    end;
end;
procedure filascolumnas(var filas,columnas:string);
var
    mensaje:string;
begin
    mensaje:='numeros';
    clrscr;
    writeln;
    writeln;
    write('  ');writeln('Introduzca la cantidad de filas');
    mensaje:='numero';
    leernumeros(filas,mensaje);
    clrscr;
    writeln;
    writeln;
    write('  ');writeln('Introduzca la cantidad de columnas');
    leernumeros(columnas,mensaje);
end;
function mochila(var posmorral:string; var col:integer):integer;
var 
    mensaje:string;
    posm:integer;
begin 
    repeat
        writeln;
        writeln;
        write('  ');writeln('Introduzca la posicion de la columna donde se encuentra el morral');
        mensaje:='mochila';
        leernumeros(posmorral,mensaje);
        posm:=strtoint(posmorral);
        if (posm>col) or (posm<1) then
            writeln('Intente de nuevo');
    until (posm<=col) and (posm>=1);
    mochila:=posm;
end;
BEGIN
    t1:='0,0'; 

    Assign(ent,'C:\Datos\Prueba.txt');
    Assign(ent2,'C:\Datos\Prueba2.txt');
    Assign(ent3,'C:\Datos\Pruebacolor.txt');
    Assign(ent4,'C:\Datos\Pruebarestoz.txt');
    assign(sal,'C:\Datos\RutaFinal.txt');
    clrscr;
    Writeln;
    Writeln;
    write('                             ');textbackground(14);textcolor(0);Writeln('BIENVENIDO');Textbackground(0);
    write('                       ');textbackground(14);textcolor(0);writeln('PEQUEÑOS EXPLORADORES');
    delay(3000);
    textcolor(15);
    textbackground(0);
    textcolor(4);
     Write('                               ');Writeln('Reglas' );
     delay(3000);
     textcolor(15);Write('1.');textcolor(4);Textbackground(15);Writeln('El movimiento del explorador se hara con las flechas del teclado');Textbackground(0);
     textcolor(15);Write('2.');textcolor(4);Textbackground(15);Writeln('No se puede pasar por las piedras caidas (piedras grises)');Textbackground(0);
     delay(3000);
     textcolor(15);Write('3.');textcolor(4);Textbackground(15);writeln('Al intentar pasar varias veces por un camino no campatible se');
     writeln('reinicia desde el principio (perdiendo la ruta anterior)');Textbackground(0);
     delay(3000);
     textcolor(15);Write('4.');textcolor(4);Textbackground(15);writeln('El maximo de filas y columnas es de 15x15');
     delay(3000);
     textcolor(15);Write('nota:');textcolor(4);Textbackground(15);Writeln('La ruta quedara guardada en el archivo de salida ubicado en C:\Datos');Textbackground(0);
     delay(5000);
    clrscr;
 repeat 
    repeticion:=true;
    repeat
        writeln;
        writeln;
        vad:=false;
        textcolor(white);
        Write('                               ');writeln('Introduzca valor del explorador');
        mensaje:='numero'; 
        Write('                               ');readln(explorador);
        vad:=validacion(explorador,mensaje); 
        if vad=false then 
            begin 
                textcolor(4);
                Write('                               '); writeln('Introduzca un valor valido');
                delay(2000);
                ClrScr;
                textcolor(15);
            end;
    until vad=true;
    repeat
        Write('                               ');writeln('Introduzca el color del explorador');
        coloresidentificados;
        mensaje:='colores';
        Write('                               ');leernumeros(color,mensaje);
        if color='0' then 
            begin
                writeln;
                writeln;
                textcolor(4);
                writeln('Intente de nuevo'); 
                delay(2000);
            end;
    until color<>'0';
    regcolor:=color;
    color:=valor_color(color);
    repeat 
        repeticion2:=true;
    repeat
        ClrScr;
        writeln;
        writeln;
        Write('                               ');writeln('MAPA');
        Write('                               ');writeln('¿Como deseas llenar el mapa?');
        Write('                               ');writeln('1. Manual');
        Write('                               ');writeln('2. Random');
        Write('                               ');writeln('3. Con archivo');
        Write('                               ');readln(opma);
        mensajevs:='matriz'; 
        vs:=validacion_completa(opma,mensajevs);
    until vs=true;
    opcion:=StrToInt(opma);
    Case opcion of
        1:begin 
            filascolumnas(filas,columnas);
            fil:=strtoint(filas);
            col:=strtoint(columnas);
            fil:=fil+2;
            posm:=mochila(posmorral,col);
            reanudarmatriz(m,moriginal,fil,col,posm);
            la matriz anterior}
            reanudarcolores(n,fil,col); 
            llenar_matriz_manual(m,moriginal,n,m_color_ant, fil, col,posm);
        end;
        2:begin 
            filascolumnas(filas,columnas);
            fil:=strtoint(filas);
            col:=strtoint(columnas);
            fil:=fil+2;
            posm:=mochila(posmorral,col);
            llenar_matriz_random(m,moriginal,fil,col,posm);
            colores(n,m_color_ant,m,moriginal,fil,col);

        end;
        3:begin 
            leer_archivo(ent,ent2,fil,col);
            larchivo(ent2,ent3,ent4,ncolor,fil,col,m_color_ant,m,n);
            fil:=fil+2;
            posm:=mochila(posmorral,col);
            matrizarchivo(ent3,ent4,m,moriginal,m_color_ant,n,fil,col,posm);
        end;
    end;
    x:=fil;
    y:=1;
    cont:=1;
    rewrite(sal);
    coma:=',';
  repeat
       ClrScr;
        matriz_interactiva(m,moriginal,n,fil,col,x,y,cont,explorador,color,a,b);
        writeln;
        textcolor(14);
        writeln('Presione k para ver opciones');
        textcolor(15);
        a[cont]:=x;
        b[cont]:=y;
        a1:=inttostr(x-2);
        b1:=inttostr(y);
        t:='';
        t:=a1+coma+b1;
        if t<>t1 then
            Writeln(sal,t);
        t1:=t;
        varanteriorx:=x; 
        varanteriory:=y;
        cont:=cont+1; 
        tecla:=ReadKey;
        win:=false;
        case tecla of
            #72: begin
                   if (x<=fil) and (x>1) then
                        begin 
                            if m[x-1,y]='#' then 
                                begin 
                                    x:=x-1; 
                                    ClrScr;
                                    writeln;
                                    textcolor(10);
                                    writeln('FELICIDADES HAS LLEGADO A LA MOCHILA :D'); 
                                    textcolor(15);
                                    bmodi:=false; 
                                    menuopciones(repeticion2,repeticion,win); 
                                end
                            else 
                                begin
                                    x:=x-1;
                                    movimiento(m,m_color_ant,x,y,varanteriorx,varanteriory,fil,explorador,regcolor);
                                    reiniciar(x,y,varanteriorx,varanteriory,contador,cont,guardadox,guardadoy,a,b);
                                end;
                        end
                    else 
                        begin
                            textcolor(4); 
                            writeln('Movimiento invalido');
                        end;
                end; //arriba
            #80: begin
                   if (x<fil) then
                        begin
                            x:=x+1;
                            movimiento(m,m_color_ant,x,y,varanteriorx,varanteriory,fil,explorador,regcolor);
                            reiniciar(x,y,varanteriorx,varanteriory,contador,cont,guardadox,guardadoy,a,b);
                        end
                    else
                        begin
                            textcolor(4); 
                            writeln('Movimiento invalido');
                        end;
                    end; //abajo
            #75:begin
                   if (y<=col) and (y>1) then
                        begin 
                            y:=y-1;
                            movimiento(m,m_color_ant,x,y,varanteriorx,varanteriory,fil,explorador,regcolor);
                            reiniciar(x,y,varanteriorx,varanteriory,contador,cont,guardadox,guardadoy,a,b);
                        end
                   else
                        begin
                            textcolor(4); 
                            writeln('Movimiento invalido');
                        end;
                end; //izquierda
            #77: begin
                   if (y<col) then
                        begin
                            y:=y+1;
                            movimiento(m,m_color_ant,x,y,varanteriorx,varanteriory,fil,explorador,regcolor);
                            reiniciar(x,y,varanteriorx,varanteriory,contador,cont,guardadox,guardadoy,a,b);
                        end
                   else
                        begin
                            textcolor(4); 
                            writeln('Movimiento invalido');
                        end;
                   end; //derecha
            'k':begin 
                    bmodi:=false;
                    ClrScr;
                    menuopciones(repeticion2,repeticion,win);
                end;            
        end;
        t:='';
   if (x=1) and (y=posm) then 
    win:=true;
    
  until win=true;
 until (repeticion2=false) and (win=true);
 until (repeticion=false) and (repeticion2=false) and (win=true);
    close(sal);
    textcolor(10);
    writeln('GRACIAS POR JUGAR');
    writeln('NAHOMY RADA Y ZAHED CHACOUR');
    delay(6000);
    readln;
end.              