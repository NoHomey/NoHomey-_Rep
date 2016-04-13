#Which are the Article_15(s) for a given User
use exam;

select Article_15.id from Article_15
inner join Article_15_Tag on Article_15_Tag.Article_15_id = Article_15.id
inner join Tag on Article_15_Tag.Tag_id = Tag.id
inner join User_part2 on User_part2.Tag_id = Tag.id
where User_part2.id = 2;
