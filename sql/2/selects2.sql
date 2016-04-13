#Which are the Tag(s) for a given Category

use exam;

select Tag.id from Tag
inner join Article_15_Tag on Article_15_Tag.Tag_id = Tag.id
inner join Article_15 on Article_15_Tag.Article_15_id = Article_15.id
inner join Category_part2 on Article_15.Category_id = Category_part2.id
where Category_part2.id = 2;
