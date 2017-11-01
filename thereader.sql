use oracle;
show tables;
desc tbl_nlu;
desc tbl_email;
select * from tbl_email;
select distinct sender from tbl_email;




select distinct date from tbl_email order by 1 desc;

select distinct cast(date as char) from tbl_email order by 1 desc;
    

select no, sender, date, subject, text, wordcount 
		from tbl_email
		where subject like '%' || '' || '%';

	select no, sender, date, subject, text, wordcount 
		from tbl_email	
		where 1=1
		and subject like concat('%',2004,'%');
        
        
select sender, count(*) from tbl_email group by sender;


select sender,	date,	Openness,	Adventurousness,	Artistic_interests,	Emotionality,	Imagination,	Intellect,	Authority_challenging,	Conscientiousness,	Achievement_striving,	Cautiousness,	Dutifulness,	Orderliness,	Self_discipline,	Self_efficacy,	Extraversion,	Activity_level,	Assertiveness,	Cheerfulness,	Excitement_seeking,	Outgoing,	Gregariousness,	Agreeableness,	Altruism,	Cooperation,	Modesty,	Uncompromising,	Sympathy,	Trust,	Emotional_range,	Fiery,	Prone_to_worry,	Melancholy,	Immoderation,	Self_consciousness,	Susceptible_to_stress 
		from tbl_PI
		where sender="trump@whitehouse.com";

select * from tbl_PI;


desc tbl_PI;
desc tbl_email;
desc tbl_result;
create table tbl_PI(
	no int NOT NULL PRIMARY KEY auto_increment,
	sender varchar(40) NOT NULL,
	date      DATETIME DEFAULT   CURRENT_TIMESTAMP,
	Openness	double,
	Adventurousness	double,
	Artistic_interests	double,
	Emotionality	double,
	Imagination	double,
	Intellect	double,
	Authority_challenging	double,
	Conscientiousness	double,
	Achievement_striving	double,
	Cautiousness	double,
	Dutifulness	double,
	Orderliness	double,
	Self_discipline	double,
	Self_efficacy	double,
	Extraversion	double,
	Activity_level	double,
	Assertiveness	double,
	Cheerfulness	double,
	Excitement_seeking	double,
	Outgoing	double,
	Gregariousness	double,
	Agreeableness	double,
	Altruism	double,
	Cooperation	double,
	Modesty	double,
	Uncompromising	double,
	Sympathy	double,
	Trust	double,
	Emotional_range	double,
	Fiery	double,
	Prone_to_worry	double,
	Melancholy	double,
	Immoderation	double,
	Self_consciousness	double,
	Susceptible_to_stress	double
)

