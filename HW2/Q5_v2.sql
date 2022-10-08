--database software: Oracle liveSQL
--Name: Yuhang Xiao, NetID: YXiao776
--version_2
--use join operator to join Offer and Candidate table with common Subject
--then use aggregate function count to count the number of offered subject taught by each instructor
--if it's equal to the number of subjects in Offer table, the instructor is the desired instructor
--Expected Output:
--| Dat |
--|Emscr|

create table Offer( 
Subject varchar(25), 
primary key (Subject));

create table Candidate(  
Instructor     varchar(25),  
Subject        varchar(25),  
primary key (Instructor, Subject));

insert into Offer (Subject) values('JavaScript');
insert into Offer (Subject) values('Scratch');
insert into Offer (Subject) values('Python');

insert into Candidate (Instructor, Subject) values ('Aleph','Scratch');
insert into Candidate (Instructor, Subject) values ('Aleph','Java');
insert into Candidate (Instructor, Subject) values ('Aleph','Processing');
insert into Candidate (Instructor, Subject) values ('Bit','Python');
insert into Candidate (Instructor, Subject) values ('Bit','JavaScript');
insert into Candidate (Instructor, Subject) values ('Bit','Java');
insert into Candidate (Instructor, Subject) values ('CRC','Python');
insert into Candidate (Instructor, Subject) values ('CRC','JavaScript');
insert into Candidate (Instructor, Subject) values ('Dat','Scratch');
insert into Candidate (Instructor, Subject) values ('Dat','Python');
insert into Candidate (Instructor, Subject) values ('Dat','JavaScript');
insert into Candidate (Instructor, Subject) values ('Emscr','Scratch');
insert into Candidate (Instructor, Subject) values ('Emscr','Processing');
insert into Candidate (Instructor, Subject) values ('Emscr','JavaScript');
insert into Candidate (Instructor, Subject) values ('Emscr','Python');

select Instructor  
from Candidate C join Offer D on C.Subject = D.Subject 
group by Instructor 
having count(Instructor) = (select count(*) from Offer);;

