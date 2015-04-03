drop table WallBoard;
drop table PaperPages;
drop table PaperArticles;
drop table Papers;
drop table Scraps;
drop table Articles;
drop table MemberCounts;
drop table Subscriptions;
drop view SubscriberNum;
drop table Members;

drop table Members;
create table Members (
	Email varchar(50) primary key,
	Password varchar(20) not null,
	Name varchar(50) not null,
	BirthDate varchar(10) not null,
	PoliticsINTS int not null,
	EconomyINTS int not null,
	SocietyINTS int not null,
	LifeCultureINTS int not null,
	WorldINTS int not null,
	ItScienceINTS int not null,
	EntertainmentINTS int not null,
	SportsINTS int not null
);

drop table MemberCounts;
create table MemberCounts (
	Email varchar(50) primary key,
	PoliticsCNT int default 0 not null,
	EconomyCNT int default 0 not null,
	SocietyCNT int default 0 not null,
	LifeCultureCNT int default 0 not null,
	WorldCNT int default 0 not null,
	ItScienceCNT int default 0 not null,
	EntertainmentCNT int default 0 not null,
	SportsCNT int default 0 not null,
	foreign key(Email) references Members(Email)
	on delete cascade on update restrict
);

drop table Subscriptions;
create table Subscriptions (
	Subscriber varchar(50) not null,
	Distributor varchar(50) not null,
	SubscriptionDate varchar(10) not null,
	foreign key(Subscriber) references Members(Email)
	on delete cascade on update restrict,
	foreign key(Distributor) references Members(Email)
	on delete cascade on update restrict,
	primary key (Subscriber, Distributor)
);

drop table Articles;
create table Articles (
	ArticleURL varchar(300) primary key,
	Title varchar(300) not null,
	Description varchar(500),
	Image varchar(300),
	Content string,
	WritingDate varchar(16) not null,
	Press varchar(50) not null,
	ArticleSection varchar(20) not null,
	ScrapCNT int default 0 not null
);

drop table Scraps;
create table Scraps (
	ScrapNum int auto_increment primary key,
	Email varchar(50) not null,
	ArticleURL varchar(300) not null,
	ScrapDate varchar(10) not null,
	foreign key(Email) references Members(Email)
	on delete cascade on update restrict,
	foreign key(ArticleURL) references Articles(ArticleURL)
);

drop table Papers;
create table Papers (
	PaperNum int auto_increment primary key,
	Email varchar(50) not null,
	Title varchar(300) not null,
	Info varchar(300),
	MakingDate varchar(16) not null,
	RecommendNum int default 0 not null,
	SubscriptionCHK int not null,
	foreign key(Email) references Members(Email)
	on delete cascade on update restrict
);

drop table PaperPages;
create table PaperPages (
	Page int not null,
	PaperNum int not null,
	FrameInform string not null,
	primary key (Page, PaperNum),
	foreign key(PaperNum) references Papers(PaperNum)
	on delete cascade on update restrict
);

drop table WallBoard;
create table WallBoard (
	BoardNum int auto_increment primary key,
	PaperNum int not null,
	Comment varchar(200),
	WritingDate varchar(16) not null,
	foreign key(PaperNum) references Papers(PaperNum)
	on delete cascade on update restrict
);

drop table PaperArticles;
create table PaperArticles (
	PaperArticleNum int auto_increment primary key,
	ArticleURL varchar(300) not null,
	PaperNum int not null,
	foreign key(ArticleURL) references Articles(ArticleURL),
	foreign key(PaperNum) references Papers(PaperNum)
	on delete cascade on update restrict
);

drop view SubscriberNum;
CREATE VIEW SubscriberNum
AS SELECT distributor, COUNT(*) as followerCount
FROM subscriptions
GROUP BY distributor
ORDER BY followerCount DESC;