uses    crt;
var     f:text;
        a:array[1..100] of integer;
        j,i,x,n,dem,vtd,vtc,vtd2,vtc2,vd,vc,r,max:integer;
        kt:boolean;
begin
        assign(f,'dayloi.inp');
        reset(f);
        readln(f,n);
        for i:=1 to n do
                read(f,a[i]);
        close(f);
        assign(f,'dayloi.out');
        rewrite(f);
        x:=0;
        kt:=true;
        for i:=1 to n do
        begin
                if kt=false then
                        break;
                if a[i]>a[i+1] then
                        for j:=i to n do
                        begin
                                if kt=false then
                                        break;
                                if (a[j]>a[j+1]) and (x=0) then
                                        dem:=dem+1;
                                if (a[j]=a[j+1]) or (a[j]<a[j+1]) or (j=n) then
                                begin
                                        vtc:=j;
                                        vtd:=j-dem;
                                        kt:=false;
                                        for r:=j+1 to n do
                                        begin
                                                if (a[vtc]>a[r]) and (a[r]<a[r+1]) then
                                                begin
                                                        dem:=0;
                                                        for x:=r to n do
                                                        begin
                                                        if a[x]<a[x+1] then
                                                                dem:=dem+1;
                                                        if (a[x]=a[x+1]) or (a[x]>a[x+1]) or (x=n) then
                                                        begin
                                                                vtc2:=x;
                                                                vtd2:=x-dem;
                                                                break;
                                                        end;
                                                        end;
                                                end;
                                                if (a[vtc]<a[r]) then
                                                begin
                                                        dem:=0;
                                                        for x:=r to n do
                                                        begin
                                                        if a[x]<a[x+1] then
                                                                dem:=dem+1;
                                                        if (a[x]=a[x+1]) or (a[x]>a[x+1]) or (x=n) then
                                                        begin
                                                                vtc2:=x;
                                                                vtd2:=x-dem;
                                                                break;
                                                        end;
                                                        end;
                                                end;
                                                if (vtc2-vtd2+1)>max then
                                                begin
                                                        vd:=vtd2;
                                                        vc:=vtc2;
                                                        max:=vtc2-vtd2+1;
                                                end;
                                        end;
                                end;
                        end;
                end;
        if (max>0) then
        begin
                writeln(f,(vtc-vtd+1+max));
                for i:=vtd to vtc do
                        write(f,a[i],' ');
                for i:=vd to vc do
                        write(f,a[i],' ');
        end
        else
                write(f,'-1');
        close(f);
end.

