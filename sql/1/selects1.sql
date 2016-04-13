#Which are the Tag(s) for a given Category
use exam;

select Tag.id from Tag
inner join User on User.Tag_id = Tag.id
inner join Category on User.Category_id = Category.id
where Category.id = 2;
