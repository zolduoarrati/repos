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


create table `calcium-scholar-258203.stackoverflow.Users_usa_badges_comments_posts` as
SELECT u.*, count(p.id) A_questions
FROM `calcium-scholar-258203.stackoverflow.Users_usa_badges_comments_Qposts` u
left join `calcium-scholar-258203.stackoverflow.Posts_Answers` p on u.Id = p.OwnerUserId
group by Id, AboutMe, CreationDate, DisplayName, DownVotes, LastAccessDate, Location, Reputation, UpVotes, Views, T_badges, Q_comments, A_comments, P_questions
order by u.Id asc;


create table `calcium-scholar-258203.stackoverflow.Users_Usa_Badges_Comments_Posts_PostHistory` as
SELECT u.*, count(ph.id) postHistory
FROM `calcium-scholar-258203.stackoverflow.Users_Usa_Badges_Comments_Posts` u
left join `calcium-scholar-258203.stackoverflow_bq.post_history` ph on u.Id = ph.user_id
group by Id, AboutMe, CreationDate, DisplayName, DownVotes, LastAccessDate, Location, Reputation, UpVotes, Views, badges, Q_comments, A_comments, P_questions, P_answers
order by u.Id asc;

create table `calcium-scholar-258203.stackoverflow.Users_Posts_QA` as
SELECT OwnerUserId Id, pq.P_questions, pa.P_answers
FROM `calcium-scholar-258203.stackoverflow.Users_Posts_Q` pq
full join `calcium-scholar-258203.stackoverflow.Users_Posts_A` pa using (OwnerUserId)
order by Id asc;


create table `calcium-scholar-258203.stackoverflow.Users_PostHistory` as
SELECT p.user_id id, count(p.id) postHistory
FROM `calcium-scholar-258203.stackoverflow_bq.post_history` p
group by id
order by id asc;


create table `calcium-scholar-258203.stackoverflow.Posts_WikiPlaceholder_UserCount` as 
SELECT OwnerUserId, count(p.Id) WikiPlaceholder
FROM `calcium-scholar-258203.stackoverflow.Posts_WikiPlaceholder` p
group by OwnerUserId
order by OwnerUserId asc;

------------------------------------------------------------------------------------------------------------------
create table `calcium-scholar-258203.stackoverflow.Users_china_badges` as
SELECT u.Id, u.AboutMe, u.CreationDate, u.DisplayName, u.DownVotes, u.LastAccessDate, u.Location, u.Reputation, u.UpVotes, u.Views, count(b.id) badges
FROM `calcium-scholar-258203.stackoverflow.Users_china` u
left join `calcium-scholar-258203.stackoverflow.Badges` b on u.id = b.UserId
group by u.Id, u.AboutMe, u.CreationDate, u.DisplayName, u.DownVotes, u.LastAccessDate, u.Location, u.Reputation, u.UpVotes, u.Views
order by u.Id asc;

create table `calcium-scholar-258203.stackoverflow.Users_russia_badges_comments` as
SELECT u.*,b.Q_comments, b.A_comments
FROM `calcium-scholar-258203.stackoverflow.Users_russia_badges` u
left join `calcium-scholar-258203.stackoverflow.Users_Comments_QA` b using (Id)
order by u.Id asc;

