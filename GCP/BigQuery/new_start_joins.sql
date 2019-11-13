create table `calcium-scholar-258203.stackoverflow.Users_usa_badges_comments` as
SELECT u.Id, u.AboutMe, u.CreationDate, u.DisplayName, u.DownVotes, u.LastAccessDate, u.Location, u.Reputation, u.UpVotes, u.Views, u.T_badges, count(c.id) T_comments
FROM `calcium-scholar-258203.stackoverflow.Users_usa_badges` u
left join `calcium-scholar-258203.stackoverflow_bq.comments` c on u.Id = c.user_id
group by Id, AboutMe, CreationDate, DisplayName, DownVotes, LastAccessDate, Location, Reputation, UpVotes, Views
order by u.Id asc;



create table `calcium-scholar-258203.stackoverflow.Users_usa_badges_comments_posts` as
SELECT u.Id, u.AboutMe, u.CreationDate, u.DisplayName, u.DownVotes, u.LastAccessDate, u.Location, u.Reputation, u.UpVotes, u.Views, u.T_badges, T_comments, count(p.id) T_posts
FROM `calcium-scholar-258203.stackoverflow.Users_usa_badges_comments` u
left join `calcium-scholar-258203.stackoverflow.Posts` p on u.Id = p.OwnerUserId
group by u.Id, u.AboutMe, u.CreationDate, u.DisplayName, u.DownVotes, u.LastAccessDate, u.Location, u.Reputation, u.UpVotes, u.Views, u.T_badges, T_comments
order by u.Id asc;


create table `calcium-scholar-258203.stackoverflow.Users_Acomments` as
SELECT c.user_id Id, count(p.id) A_comments
FROM `calcium-scholar-258203.stackoverflow_bq.comments` c
left join  `calcium-scholar-258203.stackoverflow_bq.posts_answers` p on c.post_id = p.id
group by Id
order by Id asc;


--create table`calcium-scholar-258203.stackoverflow.Users_QAcomments` as
SELECT Id, Q_comments, A_comments
FROM `calcium-scholar-258203.stackoverflow.Users_Qcomments` q
full outer join `calcium-scholar-258203.stackoverflow.Users_Acomments` a using (Id)
order by Id asc


