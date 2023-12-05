SELECT districts.name, staff_evaluations.unsatisfactory FROM districts
INNER JOIN staff_evaluations ON districts.id= staff_evaluations.district_id
WHERE staff_evaluations.unsatisfactory IS NOT NULL AND staff_evaluations.unsatisfactory != 0
ORDER BY staff_evaluations.unsatisfactory DESC,districts.name ASC ;