SELECT districts.name, expenditures.per_pupil_expenditure, staff_evaluations.exemplary FROM districts
INNER JOIN expenditures ON districts.id=expenditures.district_id
INNER JOIN staff_evaluations ON districts.id = staff_evaluations.district_id
WHERE districts.type = 'Public School District' AND
expenditures.per_pupil_expenditure > (SELECT ROUND(AVG("per_pupil_expenditure"),2)
    AS "Average District Per-Pupil Expenditure"
    FROM "expenditures"
) AND staff_evaluations.exemplary > (SELECT ROUND(AVG("exemplary"),2) FROM "staff_evaluations")
 ORDER BY staff_evaluations.exemplary DESC, expenditures.per_pupil_expenditure DESC;