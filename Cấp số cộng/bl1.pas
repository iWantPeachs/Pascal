uses    crt;
var     a:array[1..100] of integer;
        max,min,i:integer;
        f:text;
begin
        assign(f,'bl1.inp');
        reset(f);
        for i:=1 to 3 do
                read(f,a[i]);
        close(f);
        assign(f,'bl1.out');
        rewrite(f);
        if ((a[2]-a[1])+a[2]) = a[3] then
                write(f,a[3]+a[2]-a[1])
        else
        begin
                max:=-32678;
                min:=32678;
                for i:=1 to 3 do
                begin
                        if a[i]>max then
                                max:=a[i];
                        if a[i]<min then
                                min:=a[i];
                end;
                for i:=1 to 3 do
                        if (min<a[i]) and (a[i]<max) then
                        begin
                                if ((a[i]-min)*2+a[i]) = max then
                                        write(f,a[i]+(a[i]-min))
                                else
                                if a[i]-(max-a[i])*2 = min then
                                        write(f,max-(max-a[i])*2);
                        end;
        end;
        close(f);
end.

