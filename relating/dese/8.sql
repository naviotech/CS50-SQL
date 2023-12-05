SELECT districts.name, expenditures.pupils FROM districts
INNER JOIN expenditures ON districts.id=expenditures.district_id;