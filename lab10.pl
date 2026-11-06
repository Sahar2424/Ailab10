square(Side, Area, Perimeter) :-
    Area is Side * Side,
    Perimeter is 4 * Side.

rectangle(Length, Width, Area, Perimeter) :-
    Area is Length * Width,
    Perimeter is 2 * (Length + Width).

triangle(Base, Height, Side1, Side2, Area, Perimeter) :-
    Area is (Base * Height) / 2,
    Perimeter is Base + Side1 + Side2.


valid_user(admin, 1111).
valid_user(student, 2222).

login :-
    login_attempts(3).

login_attempts(0) :-
    write('Sorry, you exceeded the maximum number of attempts, try again later.').

login_attempts(Attempts) :-
    Attempts > 0,
    write('Enter username: '),
    read(Username),
    write('Enter password: '),
    read(Password),
    (
        valid_user(Username, Password)
        ->
        write('Login Successful!')
        ;
        write('Login Unsuccessful!'),
        nl,
        NewAttempts is Attempts - 1,
        login_attempts(NewAttempts)
    ).
