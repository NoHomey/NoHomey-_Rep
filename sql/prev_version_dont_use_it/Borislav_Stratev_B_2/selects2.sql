#Which are the Article_1(s) for a given User

use exam;

select Article_1.id from Article_1
inner join Category on Article_1.Category_id = Category.id
inner join User_part2 on Category.User_id = User_part2.id
where User_part2.id = 2;
