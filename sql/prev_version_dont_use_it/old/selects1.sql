#Which are the Tag(s) for a given User
use exam;

select Tag.id from Tag
inner join Article_16 on Tag.id = Article_16.Tag_id
inner join Article_16_User on Article_16.id = Article_16_User.Article_16_id
inner join User on Article_16_User.User_id = User.id
where User.id = 2;
