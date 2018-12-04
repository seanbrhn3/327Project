create view find_events_and_orgs as 
select event_name, organization_name, date_format(event_date,"%Y/%d/%m") from Events join Organization using(organization_id) where dresscode_id = 1;

create view find_all_professionals_and_if_they_have_food as
select organization_name,organization_description from Events join Organization using(organization_type) where organization_type = 3 and Food=True group by organization_name;

create view what_items_to_bring as
select event_name, items from item-to-bring join Events using(event_id) where is_items = True;

create view all_non_causal_events_and_what_to_wear as
select temp.event_name as Events, dresscode.Type_of_dress_code as "Dress Code", dresscode.Dress_code_description as Description
from (select event_name, Dresscode_Dress_code_id from events where Dresscode_Dress_code_id > 2) temp
left join dresscode on temp.Dresscode_Dress_code_id = dresscode.Dress_code_id
order by dresscode.Dress_code_description;
