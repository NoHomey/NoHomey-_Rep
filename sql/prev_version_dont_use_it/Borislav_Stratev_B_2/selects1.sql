#Which are the Category(s) for a given Tag
use exam;

select Category.id from Category
inner join User on Category.User_id = User.id
inner join Tag on Tag.User_id = User.id
where User.id = 2;
