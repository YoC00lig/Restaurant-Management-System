-- auto-generated definition
create table Parameters
(
    [key]       varchar(50) not null
        check ([key] = 'WK' OR [key] = 'WZ' OR [key] = 'Z1' OR [key] = 'K2' OR [key] = 'K1' OR [key] = 'R2' OR
               [key] = 'R1' OR [key] = 'D1'),
    value       int         not null
        check ([value] > 0),
    description nchar(50) default NULL,
    startDate   date        not null,
    constraint Parameters_pk
        primary key nonclustered ([key], startDate)
)
go

create index ix_parameters_dates
    on Parameters (startDate)
go

grant delete, insert, select, update on Parameters to Manager
go

