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


create table `calcium-scholar-258203.stackoverflow.Users_russia_gen` as
SELECT Id OwnerUserId, AboutMe, CreationDate, DisplayName, DownVotes, LastAccessDate, Location, Reputation, UpVotes, Views, badges, Q_comments, A_comments, P_questions, P_answers, postHistory
FROM `calcium-scholar-258203.stackoverflow.Users_Russia_Badges_Comments_Posts_PostHistory`
order by OwnerUserId asc;


create table `calcium-scholar-258203.stackoverflow.Users_russia_gen_all` as 
SELECT OwnerUserId, AboutMe, CreationDate, DisplayName, DownVotes, LastAccessDate, Location, Reputation, UpVotes, Views, badges, Q_comments, A_comments, P_questions, P_answers , ModeratorNomination p_ModeratorNomination, PrivilegeWiki p_PrivilegeWiki, TagWiki p_TagWiki, TagWikiExerpt p_TagWikiExerpt, Wiki p_Wiki, WikiPlaceholder p_WikiPlaceholder, postHistory
FROM `calcium-scholar-258203.stackoverflow.Users_russia_gen` u
left join `calcium-scholar-258203.stackoverflow.Posts_ModeratorNomination_UserCount` m using (OwnerUserId)
left join `calcium-scholar-258203.stackoverflow.Posts_PrivilegeWiki_UserCount` p using (OwnerUserId)
left join `calcium-scholar-258203.stackoverflow.Posts_TagWiki_UserCount` w using (OwnerUserId)
left join `calcium-scholar-258203.stackoverflow.Posts_TagWikiExerpt_UserCount` e using (OwnerUserId)
left join `calcium-scholar-258203.stackoverflow.Posts_Wiki_UserCount` k using (OwnerUserId)
left join `calcium-scholar-258203.stackoverflow.Posts_WikiPlaceholder_UserCount` wp using (OwnerUserId)
order by OwnerUserId asc;


create table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType` as
SELECT u.Id, p.PostHistoryTypeId,count(p.Id) PostHistory
FROM `calcium-scholar-258203.stackoverflow.Users` u
join `calcium-scholar-258203.stackoverflow.PostHistory` p on u.DisplayName = p.UserDisplayName
group by u.Id, p.PostHistoryTypeId
order by u.Id asc;


create table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_all` as 
SELECT distinct (Id),InitialTitle,
EditTitle,
InitialBody,
InitialTags,
EditBody,
EditTags,
RollbackTitle,
RollbackBody,
PostReopened,
RollbackTags,
PostClosed,
PostDeleted,
PostUndeleted,
QuestionMerged,
PostMigrated,
CommunityOwned,
PostLocked,
PostUnlocked,
QuestionUnprotected,
QuestionUnmerged,
PostDisassociated,
QuestionProtected,
SuggestedEditApplied,
UnknownDevRelatedEvent,
PostTweeted,
VoteNullificationByDev,
UnknownSuggestionEvent,
PostUnmigrated,
UnknownModeratorEvent,
UnknownEvent,
CommentDiscussionMovedToChat,
PostNoticeRemoved,
PostNoticeAdded,
PostMergeSource,
PostMigratedAway,
PostMergeDestination,
PostMigratedHere
FROM `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ`
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_1` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_2` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_3` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_4` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_5` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_6` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_7` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_8` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_9` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_10` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_11` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_12` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_13` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_14` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_15` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_16` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_17` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_18` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_19` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_20` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_21` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_22` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_23` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_24` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_25` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_26` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_27` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_28` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_29` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_30` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_31` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_33` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_34` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_35` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_36` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_37` using (Id)
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_38` using (Id)
order by Id asc;


drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_1`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_2`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_3`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_4`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_5`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_6`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_7`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_8`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_9`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_10`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_11`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_12`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_13`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_14`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_15`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_16`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_17`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_18`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_19`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_20`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_21`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_22`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_23`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_24`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_25`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_26`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_27`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_28`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_29`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_30`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_31`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_33`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_34`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_35`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_36`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_37`;
drop table `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_38`;


drop table `calcium-scholar-258203.stackoverflow.Posts_ModeratorNomination_UserCount`;
drop table `calcium-scholar-258203.stackoverflow.Posts_PrivilegeWiki_UserCount`;
drop table `calcium-scholar-258203.stackoverflow.Posts_TagWiki_UserCount`;
drop table `calcium-scholar-258203.stackoverflow.Posts_TagWikiExerpt_UserCount`;
drop table `calcium-scholar-258203.stackoverflow.Posts_Wiki_UserCount`;
drop table `calcium-scholar-258203.stackoverflow.Posts_WikiPlaceholder_UserCount`;

drop table `calcium-scholar-258203.stackoverflow.Posts_ModeratorNomination`;
drop table `calcium-scholar-258203.stackoverflow.Posts_PrivilegeWiki`;
drop table `calcium-scholar-258203.stackoverflow.Posts_TagWiki`;
drop table `calcium-scholar-258203.stackoverflow.Posts_TagWikiExerpt`;
drop table `calcium-scholar-258203.stackoverflow.Posts_Wiki`;
drop table `calcium-scholar-258203.stackoverflow.Posts_WikiPlaceholder`;

drop table `calcium-scholar-258203.stackoverflow.Users_China_Badges_Comments_Posts_PostHistory`;
drop table `calcium-scholar-258203.stackoverflow.Users_Russia_Badges_Comments_Posts_PostHistory`;
drop table `calcium-scholar-258203.stackoverflow.Users_Usa_Badges_Comments_Posts_PostHistory`;

drop table `calcium-scholar-258203.stackoverflow.Users_Posts_QA`;
drop table `calcium-scholar-258203.stackoverflow.Users_Comments_QA`;


create table `calcium-scholar-258203.stackoverflow.Users_russia_gen_alll` as
SELECT OwnerUserId Id , AboutMe, CreationDate, DisplayName, DownVotes, LastAccessDate, Location, Reputation, UpVotes, Views, badges, Q_comments, A_comments, P_questions, P_answers, p_ModeratorNomination, p_PrivilegeWiki, p_TagWiki, p_TagWikiExerpt, p_Wiki, p_WikiPlaceholder, postHistory
FROM `calcium-scholar-258203.stackoverflow.Users_russia_gen_all`
order by Id asc;


create table `calcium-scholar-258203.stackoverflow.Users_russia_info` as 
SELECT u.Id, AboutMe, CreationDate, DisplayName, DownVotes, LastAccessDate, Location, Reputation, UpVotes, Views, badges, Q_comments, A_comments, P_questions, P_answers, p_ModeratorNomination, p_PrivilegeWiki, p_TagWiki, p_TagWikiExerpt, p_Wiki, p_WikiPlaceholder, InitialTitle, EditTitle, InitialBody, InitialTags, EditBody, EditTags, RollbackTitle, RollbackBody, PostReopened, RollbackTags, PostClosed, PostDeleted, PostUndeleted, QuestionMerged, PostMigrated, CommunityOwned, PostLocked, PostUnlocked, QuestionUnprotected, QuestionUnmerged, PostDisassociated, QuestionProtected, SuggestedEditApplied, UnknownDevRelatedEvent, PostTweeted, VoteNullificationByDev, UnknownSuggestionEvent, PostUnmigrated, UnknownModeratorEvent, UnknownEvent, CommentDiscussionMovedToChat, PostNoticeRemoved, PostNoticeAdded, PostMergeSource, PostMigratedAway, PostMergeDestination, PostMigratedHere
FROM `calcium-scholar-258203.stackoverflow.Users_russia_gen_alll` u
left join `calcium-scholar-258203.stackoverflow.Users_PostHistoryType_BQ_all` using (Id)
order by Id asc;


SELECT * FROM `calcium-scholar-258203.stackoverflow.Users_tagWiki` union all 
SELECT * FROM `calcium-scholar-258203.stackoverflow.Users_tagWiki_tagWikiExerpt`
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

