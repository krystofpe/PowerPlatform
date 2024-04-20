GET:http://s0ab0gk4.cz.srv.sys:8080/getAllEntities

#CSOB Blue
66B6E3
#Orange
fcad54

If(LookUp(colEntityState; Title = "Smart"; State).Value = "fifty_fifty"; true; false)

running
fifty_fifty
not_running
unknown

Switch(
    LookUp(
        colEntityState;
        Title = "Okamžité platby";
        State
    ).Value;
    "running";
    payment_green;
    "fifty_fifty";
    payment_orange;
    "not_running";
    payment_red;
    "unknown";
    payment_unknown
)


Switch(
    LookUp(
        colEntityState;
        Title = "Okamžité platby";
        State
    ).Value;
    "running";
    status_green_circle;
    "fifty_fifty";
    status_orange_circle;
    "not_running";
    status_red_circle;
    "unknown";
    status_grey
)