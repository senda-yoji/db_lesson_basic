Q1.

create table departments(
departments_id int unsigned not null auto_increment primary key,
name varchar(20) not null,
created_at timestamp not null default current_timestamp,
updated_at timestamp not null  default current_timestamp on update current_timestamp
);

Q2.

alter table people add departments_id int unsigned after email;

alter table people modify created_at timestamp not null  default current_timestamp, modify updated_at timestamp not null default current_timestamp on update current_timestamp;

Q3.

insert into departments (name) values
 ('営業'),
 ('開発'),
 ('経理'),
 ('人事'),
 ('情報システム');

insert into people (name, email, departments_id, age, gender)
 values
 ('佐々木寿人','sample_hisato_sasaki@example.com',1,49,1),
 ('近藤誠一','sample_seiichi_kondo@example.com',1,62,1),
 ('日向 藍子','sample_aiiko_hyuga@example.com',1,37,2),
 ('魚谷 侑未','sample_yumi_uotani@example.com',2,41,2),
 ('二階堂 亜樹','sample_miki_nikaido@example.com',2,44,2),
 ('瑞原 明奈','sample_akina_mizuhara@example.com',2,39,2),
 ('本田 朋広','sample_tomohiro_honda@example.com',2,42,1),
 ('小林 剛','sample_tsuyoshi_kobayashi@example.com',3,50,1),
 ('内川 幸太郎','sample_kotaro_uchikawa@example.com',4,45,1),
 ('朝倉 康心','sample_yasushi_asakura@example.com',5,40,1);

insert into reports(person_id, content)
 values
 (3,'今日は牌譜見て反省。押し引きが甘かった。'),
 (14,'鳴きのタイミング確認。手組み直した'),
 (1,'役作りの流れ整理。次は両面優先。'),
 (9,'調子悪いので守備寄りにしてみた。結果は微妙。'),
 (6,'先制と受けのバランス考えた。テンパイ急ぎすぎた。'),
 (17,'点数計算し直して、ツモ優先の形増やした。'),
 (2,'何切る練習。よく迷うところ潰した。'),
 (11,'場の空気読み意識して、放銃減らしたい。'),
 (7,'対戦ログ見て、相手のクセメモった。押してくる。'),
 (15,'明日はもう少し早く決断して打つ。');

 Q4.

 update people set departments_id=1 where person_id=1;

 update people set departments_id=2 where person_id=2;

 update people set departments_id=3 where person_id=3;

 update people set departments_id=4 where person_id=4;

 update people set departments_id=5 where person_id=6;

 update people set departments_id=5 where person_id=7;

 Q5.

select name, age from people where gender=1 order by age desc;

Q6.

`people`というテーブルのうち、department_idが1のレコードから`name`、`email`、`age`
のカラムを取得し、created_atのカラムの値の昇順でレコードを並び替える。

Q7.

select name from people where gender=1 and age between 40 and 49 or gender=2 and age between 20 and 29;

Q8.

select name from people where departments_id=1 order by age

Q9.

select avg(age) as average_age from people where gender=2 group by gender;

Q10.

select p.name, d.name, r.content from people p join reports r on p.person_id = r.person_id join departments d on p.departments_id=d.departments_id;

Q11.

select p.name from people p left outer join reports r using (person_id) where r.content is null;