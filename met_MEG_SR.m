function X = met_MEG_SR(A,B)
n = length(B);
%Se calcula el tama�o de la matriz B
x = 1;
%Se indica cual es la primera columna en modificar
while(x ~= n  )
    %condici�n para realizar la eliminaci�n correspondiente
    B = modificarColumnasB(A,B,x,n);
    %llamado a la funci�n que modifica la matriz B
    A = modificarColumnasA(A,x,n);
    %llamado a la funci�n que modifica la matriz A
    for k = x+1: 1: n
        %Como se usar� la primera fila de pivot, se eliminar� las
        %siguientes filas (x+1)
        B(k) = B(k) - B(x);
        %Se comienza modificando la matriz B, modificando el valor de la
        %fila correspondiente con el pivot
        A(k,x:n) = A(k,x:n) - A(x,x:n);
        %Se continua con las filas de la matriz A, eliminando los elementos
        %correspondientes con los del pivot
    end
    x = x+1;
    %Contador para continuar con la eliminaci�n de las siguientes columnas
end
A = met_sus_reg(A,B);
A

function A = modificarColumnasA(A,columna,n)
    for k = columna: 1 : n;
        A(k,columna:n) = (A(k,columna:n))/A(k,columna);
    end

function B = modificarColumnasB(A,B,columna,n)
    for k = columna: 1 : n;
        B(k) = (B(k))/A(k,columna);
    end 