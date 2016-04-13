#Which are the Article_15(s) for a given User

use exam;

select Article_15.id from Article_15
inner join Category on Article_15.Category_id = Category.id
inner join User on User.Category_id = Category.id
where User.id = 3;
