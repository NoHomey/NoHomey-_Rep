#Which are the Category(s) for a given Article_16
use exam;

select Category.id from Category
inner join Tag on Category.id = Tag.Category_id
inner join Article_16_part_2 on Article_16_part_2.Tag_id = Tag.id
where Article_16_part_2.id = 2;
