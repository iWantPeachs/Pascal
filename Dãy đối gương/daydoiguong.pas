uses    crt;
var     n,i,j,w,dem:integer;
        kt:boolean;
        st:string;
        s:array[1..20] of char;
begin
        readln(n);
        kt:=true;
        for i:=1 to n do
        begin
                read(s[i]);
                st:=st+s[i];
        end;
        for i:=1 to (length(st) div 2) do
                if st[i]<>st[(length(st))-i+1] then
                begin
                        kt:=false;
                        break;
                end;
        if kt = true then
                writeln('0')
        else
                for i:=2 to length(st) do
                begin
                        if dem=1 then break;
                        if (st[i-1] = st[i+1]) and (i>(length(st) div 2)) then
                        begin
                                for j:=1 to (length(st)-i) do
                                        if st[i+j] <> st[i-j] then
                                        begin
                                                kt:=true;
                                                break;
                                        end;
                                if kt=false then
                                        for w:=(i-(length(st)-i)-1) downto 1 do
                                        begin
                                                st:=st+st[w];
                                                dem:=1;
                                        end;
                        end;
                end;
                if dem<>1 then
                        for i:=n-1 downto 1 do
                                st:=st+s[i];
        write(length(st));
        readln
end.








end.
